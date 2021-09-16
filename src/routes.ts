import express from "express"
import fs, { readFileSync } from "fs"
import path from "path"
import mysql from "mysql2"
import * as env from "dotenv"
import createReport from 'docx-templates';

env.config({ path: path.join(__dirname, "..", ".env") })

import Users from "./user.db"
import { ProductionOrders, FillfulmentControlOrder, CounterWeek } from "./orders.db"
import { OrderCounter } from "./orders"
import { Invoices, InvoicesOrders, IInvoiceOrders, IInvoice } from "./invoices.db"
const DocxMerger = require("docx-merger")

const connection = mysql.createConnection({
	host: process.env.DB_HOST,
	user: process.env.DB_USER,
	database: process.env.DB_NAME,
	password: process.env.DB_PASSWORD
})

// global classes
const userInstance: Users = new Users(connection)
const prodInstance: ProductionOrders = new ProductionOrders(connection)
const controlInstance: FillfulmentControlOrder = new FillfulmentControlOrder(connection)
const counterWeekInstance: CounterWeek = new CounterWeek(connection)
const invoicesInstance: Invoices = new Invoices(connection)
const invoicesOrdersInstance: InvoicesOrders = new InvoicesOrders(connection)
const ORDER_COUNTER: OrderCounter = new OrderCounter(controlInstance, counterWeekInstance)


type expresscb = (req: express.Request, res: express.Response) => void

export interface IRoute{
	path: string,
	name: string,
	method: "POST" | "GET",
	isPrivate: boolean,
	cb: expresscb
}

enum EURole{
	ADMIN = 0,
	EDITOR = 1,
	USER = 4,
	NONE = 999
}

const checkAuth = (token: string) => {
	interface IGUser{
		login: string,
		password: string
	}
	

	return new Promise((resolve, reject) => {
		let auth: boolean = false
		// Get all users from tables
		var decoded = userInstance.decodeToken(token) as IGUser
		userInstance.findRowByCol("login", decoded.login, (users: any[]) => {
			if(users.length === 0) reject({ error: false })
			else{
				const user = users[0]
				if(decoded.password === (userInstance.decodeToken(user.jwt) as IGUser).password) 
					resolve({
						...Object.keys(user)
							.filter((key: string) => ["login", "name", "role", "active"].includes(key))
							.reduce((prev: any, key: any) => { prev[key] = user[key]; return prev }, {}),
						error: false
					})
				else reject({ error: true })
			}
		})
	})
}

const authMiddleware = (req: express.Request, res: express.Response, next: expresscb, accessRole: number = EURole.NONE) => {
	const token = req.query.token || req.body.token || null

	interface IGUser{
		login: string,
		password: string
	}

	if(Boolean(token)){
		new Promise((resolve, reject) => {
			let auth: boolean = false
			// Get all users from tables
			var decoded = userInstance.decodeToken(token) as IGUser
			userInstance.findRowByCol("login", decoded.login, (users: any[]) => {
				if(users.length === 0) reject({ error: false, errorMessage: "Error: token is not correct" })
				else{
					const user = users[0]
					if(decoded.password === (userInstance.decodeToken(user.jwt) as IGUser).password){
						if(user.role <= accessRole) resolve({ error: false })
						else reject({ error: true, errorMessage: "Error: not enough access rights" })
					}
						
					else reject({ error: true })
				}
			})
		})
			.then((response: any) => !response.error && next(req, res))
			.catch(err => res.json({ error: true, errorMessage: err.errorMessage }))
	}
	else res.json({ error: true, errorMessage: "Error: token is empty" })
}

// -----------------------------------------------------------------------------
// ----------------------------- ROUTES CALLBACKS ------------------------------
// -----------------------------------------------------------------------------

// ------------------------------   ORDERS   -----------------------------------


const newOrderCallback = (req: express.Request, res: express.Response) => {
	// Adding to control
	const data: any = req.body
	console.log(data)
	controlInstance.add({
		id: data.additional.id,
		id_fc: data.additional.id,
		week: data.additional.week,
		site_name: data.additional.siteName,
		price: data.orders.reduce((prev: number, cur: any) => { return prev + cur.allPrice }, 0),
		client_phone: data.client.phone,
		client_name: data.client.name,
		client_address: data.client.address,
		date_order: data.additional.dateDelivery,
		date_created: `${new Date().getFullYear()}-${new Date().getMonth()}-${new Date().getDay()}`,
		year: data.additional.year,

		delivery: Number(data.additional.delivery),
		assembly: Number(data.additional.assembly),
		entering: Number(data.additional.entering),
		assemblyAndEntering: Number(data.additional.assemblyAndEntering),

		delivery_price: Number(data.additional.delivery_price),
		assembly_price: Number(data.additional.assembly_price),
		entering_price: Number(data.additional.entering_price),
		assemblyAndEntering_price: Number(data.additional.assemblyAndEntering_price),

	})

	invoicesInstance.add({
		id: data.additional.id,
		id_fc: data.additional.id,
		week: data.additional.week,
		site_name: data.additional.siteName,
		price: data.orders.reduce((prev: number, cur: any) => { return prev + cur.allPrice }, 0),
		client_phone: data.client.phone,
		client_name: data.client.name,
		client_address: data.client.address,
		date_order: data.additional.dateDelivery,
		date_created: `${new Date().getFullYear()}-${new Date().getMonth()}-${new Date().getDay()}`,
		deliver_back: 0,
		year: data.additional.year,

		delivery: Number(data.additional.delivery),
		assembly: Number(data.additional.assembly),
		entering: Number(data.additional.entering),
		assemblyAndEntering: Number(data.additional.assemblyAndEntering),

		delivery_price: Number(data.additional.delivery_price),
		assembly_price: Number(data.additional.assembly_price),
		entering_price: Number(data.additional.entering_price),
		assemblyAndEntering_price: Number(data.additional.assemblyAndEntering_price)
	})
	// Adding to prod
	req.body.orders.map((order: any) => {
		prodInstance.add({
			name: order.name,
			id_fc: data.additional.id,
			count: order.count,
			week: data.additional.week,
			material: order.material,
			color: order.color,
			date_created: `${new Date().getFullYear()}-${new Date().getMonth()}-${new Date().getDay()}`,
			id_added_user: 2,
			year: data.additional.year,
		})
		invoicesInstance.getLastRowByCol("id", (idInvoice) => {
			invoicesOrdersInstance.add({
				name: order.name,
				id_fc: data.additional.id,
				count: order.count,
				week: data.additional.week,
				material: order.material,
				color: order.color,
				id_iv: idInvoice,
				price: order.price,
				allPrice: order.allPrice
			})
		})
		
	})

	res.json({ error: false })
}

const allOrdersCallback = (req: express.Request, res: express.Response) => {

	console.log(req.query)
	switch(req.query.type){
		case "prod":
			Boolean(req.query.year)?
				prodInstance.findRowByCol("year", req.query.year! as string, (data: any) => {
					res.json({ data })
				}):
				prodInstance.getAll((data: any) => res.json({ data }))
			break
		case "control":
			Boolean(req.query.year)? 
				controlInstance.findRowByCol("year", req.query.year! as string, (data: any) => {
					res.json({ data })
				}):
				controlInstance.getAll((data: any) => res.json({ data }))
			break
		default:
			res.send("No query")
	}
}

const getNumberOrderCallback = (req: express.Request, res: express.Response) => {
	console.log(req.path, req.query)
	ORDER_COUNTER.getNumberOrder(Number(req.query.week), Number(req.query.year))
		.then((numberOrder) => {
			res.json({ id: numberOrder, error: false }) 
		})
		.catch((err: Error) => res.json({ error: true, errorMessage: err.message }) )
}

const saveProdCallback = (req: express.Request, res: express.Response) => {

	const data = req.body
	console.log(data)
	prodInstance.save(data.data)
	res.json({ error: false })
}

const saveControlCallback = (req: express.Request, res: express.Response) => {

	const data = req.body
	console.log(data)
	controlInstance.save(data.data)
	res.json({ error: false })
	
}

// -----------------------------------------------------------------------------
// -------------------------------Invoices--------------------------------------
// -----------------------------------------------------------------------------

const allInvoicesCallback = (req: express.Request, res: express.Response) => {
	console.log(req.query)
	switch(req.query.type){
		case "main":
			Boolean(req.query.year)? 
				invoicesInstance.findRowByCol("year", ""+req.query.year, (data) => {res.json({ data })}):
				invoicesInstance.getAll((_res) => { res.json({data: _res}) })
			break
		case "prods":
			invoicesOrdersInstance.getAll((_res) => { res.json({data: _res}) })
			break
		default:
			res.send("No query")
	}
}

const newInovoiceDeliverBackCallback = (req: express.Request, res: express.Response) => {
	console.log(req.query)

	const id_fc = req.body.id_fc

	try{
		invoicesInstance.findRowByCol("id_fc", id_fc, (rows: any) => {
			const data = rows[0]
			invoicesInstance.add({
				id_fc: data.id_fc,
				week: data.week,
				site_name: data.site_name,
				price: data.price,
				client_phone: data.client_phone,
				client_name: data.client_name,
				client_address: data.client_address,
				date_order: "",
				date_created: `${new Date().getFullYear()}-${new Date().getMonth()}-${new Date().getDay()}`,
				deliver_back: 1,
				year: data.year,
		
				delivery: Number(data.delivery),
				assembly: Number(data.assembly),
				entering: Number(data.entering),
				assemblyAndEntering: Number(data.assemblyAndEntering),
		
				delivery_price: Number(data.delivery_price),
				assembly_price: Number(data.assembly_price),
				entering_price: Number(data.entering_price),
				assemblyAndEntering_price: Number(data.assemblyAndEntering_price)
			})
	
			invoicesOrdersInstance.findRowByCol("id_fc", id_fc, (rows) => {
				invoicesInstance.getLastRowByCol("id", (idInvoice) => {
					rows.map(order => {
						invoicesOrdersInstance.add({
							name: order.name,
							id_fc: data.id_fc,
							count: order.count,
							week: data.week,
							material: order.material,
							color: order.color,
							id_iv: idInvoice,
							price: order.price,
							allPrice: order.allPrice
						})
					})
				})
			})
		})
		res.json({ error: false })
	}
	catch(err){
		res.json({ error: true })
	}
	
}

const getInvoiceDOCXCallback = (req: express.Request, res: express.Response) => {
	const ids: string[] = req.query.ids as string[]
	const buffersDOCX: Buffer[] = []

	res.set("Content-disposition", 'attachment; filename=' + "output.docx");
	res.set("Content-Type", "application/vnd.openxmlformats-officedocument.wordprocessingml.document");

	function getInvoiceDOCX(data: any): Promise<Buffer> {
		
		return new Promise((resolve, reject) => {
			const siteName = data.site_name
			const template = fs.readFileSync(path.join(__dirname, "../", `public/templates/invoice_${siteName}.docx`));
			
			try{
				const getBuffer = async () => {
					return await createReport({
						template,
						data
					});
				}
				getBuffer().then(_res => {
					resolve(Buffer.from(_res))
					buffersDOCX.push(Buffer.from(_res))
				})
				
			}
			catch(err: any){
				console.log("[ROUTES][DOCX] Error with docx compile", err)
				reject(err)
			}
		})
	}


	function getInvoicesDOCX(): Promise<Buffer[]>{
		return new Promise((resolve, reject) => {
			
			invoicesInstance.findRowsByCol("id", ids, (invoices) => {
				const len = invoices.length
				invoices.map(invoice => {
					invoicesOrdersInstance.findRowByCol("id_iv", invoice.id, (prods) => {
						let index = 1
						const data = {
							...invoice,
							delivery: !!invoice.delivery? `Да (${invoice.delivery_price} руб.)`: "Нет",
							assembly: !!invoice.assembly? `Да (${invoice.assembly_price} руб.)`: "Нет",
							entering: !!invoice.entering? `Да (${invoice.entering_price} руб.)`: "Нет",
							assemblyAndEntering: !!invoice.assemblyAndEntering? `Да (${invoice.assemblyAndEntering_price} руб.)`: "Нет",
							orders: [...prods.reduce((prev, curr) => { return [...prev, { ...curr, units: "шт.", index: index++}] }, [])]
						}
						getInvoiceDOCX(data)
							.then(buffer => buffersDOCX.length === len && resolve(buffersDOCX))
							.catch(err => console.log(err))
					})
				})
			})
		})
	}
	
	
	getInvoicesDOCX().then(data => {
		new DocxMerger({}, data)
			.save('nodebuffer', function (merged: any) {
				res.end(merged)
		  })
	})
	
	// res.json({ error: false })
	
}

const saveInvoiceCallback = (req: express.Request, res: express.Response) => {
	// CHECKING TO TOKEN
	interface IAction{
		type: string,
		payload?: any
	}
	enum CHANGE_TYPE{
		DELETE_ROW = "DELETE_ROW",
		NEW_ROW = "NEW_ROW",
		CHANGE = "CHANGE",
		del = "CHANGE/delivery",
		ass = "CHANGE/assembly",
		ent = "CHANGE/entering",
		assAndEnt = "CHANGE/assemblyAndEntering",
		delpr = "CHANGE/delivery_price",
		asspr = "CHANGE/assembly_price",
		entpr = "CHANGE/entering_price",
		assAndEntpr = "CHANGE/eassemblyAndEntering_price",
	}

	console.log(req.body)

	new Promise((resolve, reject) => {
		req.body.data.length !== 0 && req.body.data.map((action: IAction, index: number) => {
			try{
				switch(action.type){
					case CHANGE_TYPE.NEW_ROW:
						const changes = req.body.data
							.filter((change: any) => 
								change.type === CHANGE_TYPE.CHANGE &&
								change.payload.id === action.payload.id)
							.reduce((prev: object, curr: IAction) => { return {...prev, [curr.payload.col]: curr.payload.value} }, {})
						console.log("new row actions", changes)	

						let newInvoiceOrder: IInvoiceOrders = {
							id: action.payload.id,
							id_fc: req.body.id_fc,
							id_iv: req.body.id,
							name: "",
							count: 0,
							week: req.body.week,
							material: "",
							color: "",
							price: 0,
							allPrice: 0,
							...changes
						}
						console.log("new instance actions", newInvoiceOrder)
						
						invoicesOrdersInstance.add(newInvoiceOrder)
						break
					case CHANGE_TYPE.DELETE_ROW:
						action.payload.map((id: number) => {
							invoicesOrdersInstance.deleteById(id)
						})
						break
					case CHANGE_TYPE.CHANGE:
						invoicesOrdersInstance.update(action.payload.col, action.payload.value, action.payload.id)
						break
					case CHANGE_TYPE.del:
						invoicesInstance.update("delivery", action.payload === "Да"? "1": "0", req.body.id); break
					case CHANGE_TYPE.ass:
						invoicesInstance.update("assembly", action.payload === "Да"? "1": "0", req.body.id); break
					case CHANGE_TYPE.ent:
						invoicesInstance.update("entering", action.payload === "Да"? "1": "0", req.body.id); break
					case CHANGE_TYPE.assAndEnt:
						invoicesInstance.update("assemblyAndEntering", action.payload === "Да"? "1": "0", req.body.id); break
		
					case CHANGE_TYPE.delpr:
						invoicesInstance.update("delivery_price", action.payload, req.body.id); break
					case CHANGE_TYPE.asspr:
						invoicesInstance.update("assembly_price", action.payload, req.body.id); break
					case CHANGE_TYPE.entpr:
						invoicesInstance.update("entering_price", action.payload, req.body.id); break
					case CHANGE_TYPE.assAndEntpr:
						invoicesInstance.update("assemblyAndEntering_price", action.payload, req.body.id); break
					default:
						reject({ error: true, errorMessage: "Незарегистрированный action" })
				}
			}
			catch(err){
				reject({ error: true, errorMessage: "Кажется, ошибка в свиче" })
			}
			if(index + 1 === req.body.data.length) resolve({ error: false })
		})
	})
		.then(success => res.json(success))
		.catch(err => res.json(err))
	
	
}
// -----------------------------------------------------------------------------
// ------------------------------- USERS ---------------------------------------
// -----------------------------------------------------------------------------


const allUsersCallback = (req: express.Request, res: express.Response) => {
	console.log(req.headers)
	userInstance.getAll((_res) => {
		res.json({ data: _res })
	})
}

const registrationCallback = (req: express.Request, res: express.Response) => {
	const data = req.body

	userInstance.add({
		name: data.name,
		login: data.login,
		jwt: userInstance.generateToken(data.login, data.password),
		date_created: `${new Date().getFullYear()}-${new Date().getMonth()}-${new Date().getDay()}`,
		role: +data.role
	})

	res.json({ jwt: userInstance.generateToken(data.login, data.password) })
}

const loginCallback = (req: express.Request, res: express.Response) => {
	var privateKey = readFileSync(path.join(__dirname, "../private.key")).toString()

	const data = req.body

	interface IGUser{
		login: string,
		password: string
	}

	new Promise((resolve, reject) => {
		// var decoded = userInstance.decodeToken(user.jwt) as IGUser;
		userInstance.findRowByCol("login", data.login, (users) => {
			if(users.length === 0) reject({ error: true })
			else{
				const user = users[0]
				try{
					if(data.password === (userInstance.decodeToken(user.jwt) as IGUser).password){
						resolve({ 
							error: false,
							...Object.keys(user)
								.filter((key: string) => ["login", "name", "role", "active", "jwt"].includes(key))
								.reduce((prev: any, key: any) => { prev[key] = user[key]; return prev }, {})
						})
					}
					else reject({ error: true, errorMessage: "login or password are not correct" })
				}
				catch(err) { reject({ error: true, errorMessage: "login or password are not correct" }) }
			}
		})
	})
		.then(data => res.json(data))
		.catch(err => res.json(err))



		// // Get all users from tables
		// userInstance.getAll((usersFromTable) => {
		// 	usersFromTable.map((user) => {
		// 		try {
					
		// 			console.log(decoded)
		// 			if(decoded.login === data.login && decoded.password == data.password) {
		// 				login = true
		// 				const responseToClient = Object.keys(user)
		// 					.filter((key: string) => ["login", "name", "role", "active", "jwt"].includes(key))
		// 					.reduce((prev: any, key: any) => { prev[key] = user[key]; return prev }, {})
		// 				resolve({...responseToClient, error: false})
		// 				return;
		// 			}
		// 		} catch(err) {
		// 			reject(err)
		// 		}
		// 	})
		// 	if(!login) resolve({ error: true })
		// })
	

	// isLogin.then((data: any) => {
	// 	res.json({ 
	// 		...data
	// 	})
	// }).catch((err: Error) => {
	// 	console.log(err)
	// 	res.json({ error: true, errorMessage: "error on server" })
	// })
}

const authCallback = (req: express.Request, res: express.Response) => {
	const token = req.body.token

	interface IGUser{
		login: string,
		password: string
	}
	checkAuth(token).then((data: any) => {
		console.log("OKEY", data)
		res.json({
			...data,
			jwt: userInstance.generateToken((userInstance.decodeToken(token) as IGUser).login, (userInstance.decodeToken(token) as IGUser).password)
		})
	}).catch((err: Error) => res.json({ error: true, errorMessage: "error on server" }))
}

const saveUsersCallback = (req: express.Request, res: express.Response) => {
	const data = req.body
	userInstance.save(data.data)
		.then(d => !d.error && res.json({ error: false }))
		.catch(err => res.json({ error: true, opt: err }))
	
}

const getColorsCallback = (req: express.Request, res: express.Response) => {
	res.json({
		error: false,
		data: [
			{ id: 1, color: "венге-1" },
			{ id: 2, color: "венге-2" },
			{ id: 3, color: "венге-3" },
		]
	})
}

const homeCallback = (req: express.Request, res: express.Response) => {
	res.sendFile(path.join(__dirname, "../", "client", "index.html"))
}





export const routes: IRoute[] = [
	// Private routes
	{
		path: "/get_number_order",
		name: "Get counter number order",
		method: "GET",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, getNumberOrderCallback, EURole.USER)
	},
	{
		path: "/save_data/prod",
		name: "Save data from prod table",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, saveProdCallback, EURole.EDITOR)
	},
	{
		path: "/save_data/control",
		name: "Save data from control table",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, saveControlCallback, EURole.EDITOR)
	},
	{
		path: "/save_data/users",
		name: "Save data from users table",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, saveUsersCallback, EURole.ADMIN)
	},
	{
		path: "/save_data/invoice",
		name: "Save data from invoice table",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, saveInvoiceCallback, EURole.USER)
	},
	{
		path: "/new_invoice_deliver_back",
		name: "New order when we want create deliver back",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, newInovoiceDeliverBackCallback, EURole.USER)
	},


	// Public routes
	{
		path: "/get_invoice",
		name: "get invoice",
		method: "GET",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, getInvoiceDOCXCallback, EURole.USER)
	},
	{
		path: "/new_order",
		name: "New Order",
		method: "POST",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, newOrderCallback, EURole.USER)
	},
	{
		path: "/registration",
		name: "Registration a new user",
		method: "POST",
		isPrivate: false,
		cb: registrationCallback
	},
	{
		path: "/login",
		name: "Login a user",
		method: "POST",
		isPrivate: false,
		cb: loginCallback
	},
	{
		path: "/auth",
		name: "Authentication a user",
		method: "POST",
		isPrivate: false,
		cb: authCallback
	},
	{
		path: "/orders",
		name: "All Orders",
		method: "GET",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, allOrdersCallback, EURole.USER)
	},
	{
		path: "/invoices",
		name: "All Invoices",
		method: "GET",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, allInvoicesCallback, EURole.USER)
	},
	{
		path: "/users",
		name: "All Orders",
		method: "GET",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, allUsersCallback, EURole.ADMIN)
	},
	{
		path: "/get_colors",
		name: "All Colors",
		method: "GET",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => authMiddleware(req, res, getColorsCallback, EURole.EDITOR)
	},
	{
		path: "/",
		name: "Client App",
		method: "GET",
		isPrivate: false,
		cb: homeCallback
	},
	{
		path: "*",
		name: "Client App",
		method: "GET",
		isPrivate: false,
		cb: homeCallback
	}
]