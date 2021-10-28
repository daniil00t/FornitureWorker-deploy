import mysql from "mysql2"
import { ProductionOrders, FillfulmentControlOrder, CounterWeek } from "../db/orders.db"
import { Invoices, InvoicesOrders } from "../db/invoices.db"
import { OrderCounter } from "../orders"
import express from "express"


export default class ROUTE__Orders{
	private prodInstance: ProductionOrders
	private controlInstance: FillfulmentControlOrder
	private invoicesInstance: Invoices
	private invoicesOrdersInstance: InvoicesOrders
	private counterWeekInstance: CounterWeek
	private ORDER_COUNTER: OrderCounter


	constructor(){
		this.prodInstance = new ProductionOrders()
		this.controlInstance = new FillfulmentControlOrder()
		this.invoicesInstance = new Invoices()
		this.invoicesOrdersInstance = new InvoicesOrders()
		this.counterWeekInstance= new CounterWeek()
		this.ORDER_COUNTER = new OrderCounter(this.controlInstance, this.counterWeekInstance)
	}

	public newOrderCallback = (req: express.Request, res: express.Response) => {
		// Adding to control
		
		const hashControl = '_' + Math.random().toString(36).substr(2, 9) + '-' + Math.random().toString(36).substr(2, 9)

		const data: any = req.body
		this.controlInstance.add({
			id: data.additional.id,
			id_fc: data.additional.id,
			hash: hashControl,
			week: data.additional.week,
			site_name: data.additional.siteName,
			price: data.orders.reduce((prev: number, cur: any) => { return prev + cur.allPrice }, 0) + Number(data.additional.delivery_price),
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
			assemblyAndEntering_price: Number(data.additional.assemblyAndEntering_price)
		})
	
		this.invoicesInstance.add({
			id: data.additional.id,
			id_fc: data.additional.id,
			hash: hashControl,
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
			const hashProd = '_' + Math.random().toString(36).substr(2, 9) + '-' + Math.random().toString(36).substr(2, 9)
			
			this.prodInstance.add({
				id_fc: data.additional.id,
				hash: hashProd,
				name: order.name,
				count: order.count,
				week: data.additional.week,
				material: order.material,
				color: order.color,
				date_created: `${new Date().getFullYear()}-${new Date().getMonth()}-${new Date().getDay()}`,
				id_added_user: 2,
				year: data.additional.year,
			})
			this.invoicesInstance.getLastRowByCol("id", (idInvoice) => {
				this.invoicesOrdersInstance.add({
					id_fc: data.additional.id,
					hash: hashProd,
					name: order.name,
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
	
	public allOrdersCallback = (req: express.Request, res: express.Response) => {
	
		console.log(req.query)
		switch(req.query.type){
			case "prod":
				Boolean(req.query.year)?
					this.prodInstance.findRowByCol("year", req.query.year! as string, (data: any) => {
						res.json({ data })
					}):
					this.prodInstance.getAll((data: any) => res.json({ data }))
				break
			case "control":
				Boolean(req.query.year)? 
					this.controlInstance.findRowByCol("year", req.query.year! as string, (data: any) => {
						res.json({ data })
					}):
					this.controlInstance.getAll((data: any) => res.json({ data }))
				break
			default:
				res.send("No query")
		}
	}
	
	public getNumberOrderCallback = (req: express.Request, res: express.Response) => {
		console.log(req.path, req.query)
		this.ORDER_COUNTER.getNumberOrder(Number(req.query.week), Number(req.query.year))
			.then((numberOrder) => {
				res.json({ id: numberOrder, error: false }) 
			})
			.catch((err: Error) => res.json({ error: true, errorMessage: err.message }) )
	}
	
	public saveProdCallback = (req: express.Request, res: express.Response) => {
		const data = req.body
		console.log(data)
		this.prodInstance.save(data.data, true, (action, hash) => {
			this.invoicesOrdersInstance.updateByHASH(action.payload.col!, action.payload.value!, hash, (err, res) => {
				console.log(err, res)
			})
		})
		res.json({ error: false })
	}
	
	public saveControlCallback = (req: express.Request, res: express.Response) => {
		const data = req.body
		console.log(data)
		this.controlInstance.save(data.data, true, (action, hash) => {
			this.invoicesInstance.updateByHASH(action.payload.col!, action.payload.value!, hash, (err, res) => {
				console.log(err, res)
			})
		})
		// this.invoicesInstance.save(data.data)
		// this.invoicesOrdersInstance.save(data.data)
		res.json({ error: false })
	}
}