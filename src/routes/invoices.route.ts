import mysql from "mysql2"
import express from "express"
import path from "path"
import fs from "fs"
import createReport from 'docx-templates'
const DocxMerger = require("docx-merger")

import { Invoices, InvoicesOrders, IInvoiceOrders } from "../db/invoices.db"
import { ProductionOrders, FillfulmentControlOrder } from "../db/orders.db"
import { deflate } from "zlib"



export default class ROUTE__Invoices{
	private invoicesInstance: Invoices
	private invoicesOrdersInstance: InvoicesOrders
	private prodInstance: ProductionOrders
	private controlInstance: FillfulmentControlOrder

	constructor(){
		this.invoicesInstance = new Invoices()
		this.invoicesOrdersInstance = new InvoicesOrders()
		this.prodInstance = new ProductionOrders()
		this.controlInstance = new FillfulmentControlOrder()
	}

	public allInvoicesCallback = (req: express.Request, res: express.Response) => {
		console.log(req.query)
		switch(req.query.type){
			case "main":
				Boolean(req.query.year)? 
					this.invoicesInstance.findRowByCol("year", ""+req.query.year, (data) => {res.json({ data })}):
					this.invoicesInstance.getAll((_res) => { res.json({data: _res}) })
				break
			case "prods":
				this.invoicesOrdersInstance.getAll((_res) => { res.json({data: _res}) })
				break
			default:
				res.send("No query")
		}
	}
	
	public newInovoiceDeliverBackCallback = (req: express.Request, res: express.Response) => {
		console.log(req.query)
	
		const id_fc = req.body.id_fc
	
		try{
			this.invoicesInstance.findRowByCol("id_fc", id_fc, (rows: any) => {
				const data = rows[0]
				this.invoicesInstance.add({
					id_fc: data.id_fc,
					hash: '_' + Math.random().toString(36).substr(2, 9) + '-' + Math.random().toString(36).substr(2, 9),
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
		
				this.invoicesOrdersInstance.findRowByCol("id_fc", id_fc, (rows) => {
					this.invoicesInstance.getLastRowByCol("id", (idInvoice) => {
						rows.map(order => {
							this.invoicesOrdersInstance.add({
								name: order.name,
								id_fc: data.id_fc,
								hash: order.hash,
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
	
	public getInvoiceDOCXCallback = (req: express.Request, res: express.Response) => {
		const ids: string[] = req.query.ids as string[]
		const buffersDOCX: Buffer[] = []
	
		res.set("Content-disposition", 'attachment; filename=' + "output.docx");
		res.set("Content-Type", "application/vnd.openxmlformats-officedocument.wordprocessingml.document");
	
		const self = this
		function getInvoiceDOCX(data: any): Promise<Buffer> {
			
			return new Promise((resolve, reject) => {
				const siteName = data.site_name
				const template = fs.readFileSync(path.join(__dirname, "../", "../", `public/templates/invoice_${siteName}.docx`));
				
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
			return new Promise(function (resolve, reject){
				
				self.invoicesInstance.findRowsByCol("id", ids, (invoices) => {
					const len = invoices.length
					invoices.map(invoice => {
						self.invoicesOrdersInstance.findRowByCol("id_iv", invoice.id, (prods) => {
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
	
	public saveInvoiceCallback = (req: express.Request, res: express.Response) => {
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
			assAndEntpr = "CHANGE/assemblyAndEntering_price",
		}
	
		console.log(req.body)
	
		new Promise((resolve, reject) => {
			req.body.data.length !== 0 && req.body.data.map((action: IAction, index: number) => {
				console.log(action)
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
							
							this.invoicesOrdersInstance.add(newInvoiceOrder)
							break
						case CHANGE_TYPE.DELETE_ROW:
							action.payload.map((id: number) => {
								this.invoicesOrdersInstance.deleteById(id)
							})
							break
						case CHANGE_TYPE.CHANGE:
							this.invoicesOrdersInstance.update(action.payload.col, action.payload.value, action.payload.id, (err: Error, res: any[]) => {
								if(!req.body.deliver_back){
									// exeption
									switch(action.payload.col){
										case "allPrice":
											console.log("-> allPrice")
											break
										case "priceAllControl":
											// id -> id_fc
											console.log("-> priceAllControl")
											this.controlInstance.updateByAny("price", action.payload.value, "id_fc", action.payload.id)
											break
										default:
											console.log(action.payload.col)
											this.invoicesOrdersInstance.findRowByCol("id", ""+action.payload.id, (dataRes) => {
												this.prodInstance.updateByHASH(action.payload.col, action.payload.value, dataRes[0].hash)
											})
									}
								}
							})
							break
						case CHANGE_TYPE.del:
							this.invoicesInstance.update("delivery", action.payload === "Да"? "1": "0", req.body.id); break
						case CHANGE_TYPE.ass:
							this.invoicesInstance.update("assembly", action.payload === "Да"? "1": "0", req.body.id); break
						case CHANGE_TYPE.ent:
							this.invoicesInstance.update("entering", action.payload === "Да"? "1": "0", req.body.id); break
						case CHANGE_TYPE.assAndEnt:
							this.invoicesInstance.update("assemblyAndEntering", action.payload === "Да"? "1": "0", req.body.id); break
			
						case CHANGE_TYPE.delpr:
							this.invoicesInstance.update("delivery_price", action.payload, req.body.id); break
						case CHANGE_TYPE.asspr:
							this.invoicesInstance.update("assembly_price", action.payload, req.body.id); break
						case CHANGE_TYPE.entpr:
							this.invoicesInstance.update("entering_price", action.payload, req.body.id); break
						case CHANGE_TYPE.assAndEntpr:
							this.invoicesInstance.update("assemblyAndEntering_price", action.payload, req.body.id); break
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
}