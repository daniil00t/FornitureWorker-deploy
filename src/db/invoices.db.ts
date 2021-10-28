import DB from "../db"
import 'reflect-metadata'

export interface IInvoiceOrders{
	id?: number
	id_fc: number
	id_iv: number
	hash: string
	name: string
	count: number
	week: number
	material: string
	color: string
	price: number
	allPrice: number
}

export interface IInvoice{
	id?: number
	id_fc: number
	hash: string
	week: number
	site_name: string
	date_order: string
	client_phone: string
	client_name?: string
	client_address?: string
	price: number
	status?: string
	paid?: number
	date_created: string
	year: number
	deliver_back?: number

	delivery?: number
	assembly?: number
	entering?: number
	assemblyAndEntering?: number

	delivery_price?: number
	assembly_price?: number
	entering_price?: number
	assemblyAndEntering_price?: number
}

interface IEditing{
	row: number
	col: string
	value: string
}


export class Invoices extends DB {
	constructor(){
		super("invoices")
	}

	public getAll(cb: (res: any) => void, year?: number) {
		let query = ""
		if(year !== undefined)
			query = `SELECT * FROM ${this.table} where date_created >= "${year}-01-01" ORDER BY id_fc DESC`
		else
			query = `SELECT * FROM ${this.table} ORDER BY id_fc DESC`

		this.connection.query(query, (err: Error, res: any[]) => {
			if(err) console.error(err)
			else {
				console.log(query, res)
				cb(res)
			}
		})
	}

	public add(invoice: IInvoice){
		this.connection.query(`insert into ${this.table} (id, id_fc, hash, week, site_name, date_order, date_created, client_phone, client_name, client_address, price, status, paid, year, deliver_back, delivery, assembly, entering, assemblyAndEntering, delivery_price, assembly_price, entering_price, assemblyAndEntering_price)
		values (NULL, ${invoice.id_fc}, "${invoice.hash}",  ${invoice.week}, "${invoice.site_name}", "${invoice.date_order}", "${invoice.date_created}", "${invoice.client_phone}", "${invoice.client_name}", "${invoice.client_address}", ${invoice.price}, "${invoice.status}", 0, ${invoice.year}, ${invoice.deliver_back}, ${invoice.delivery},${invoice.assembly},${invoice.entering}, ${invoice.assemblyAndEntering}, ${invoice.delivery_price},${invoice.assembly_price},${invoice.entering_price}, ${invoice.assemblyAndEntering_price})`, (err: Error, res) => {
			if(err) console.error(err)
			else console.log(`[DB][INFO] Insert data to '${this.table}' table successed!`)
		})
		return invoice.hash
	}
	
}

export class InvoicesOrders extends DB {
	constructor(){
		super("invoice_orders")
	}


	public add(invoiceOrder: IInvoiceOrders){
		this.connection.query(`insert into ${this.table} (id, id_fc, id_iv, hash, name, count, week, material, color, price, allPrice) 
		values (NULL, ${invoiceOrder.id_fc}, ${invoiceOrder.id_iv}, "${invoiceOrder.hash}", "${invoiceOrder.name}", ${invoiceOrder.count}, ${invoiceOrder.week}, "${invoiceOrder.material}","${invoiceOrder.color}", ${invoiceOrder.price}, ${invoiceOrder.allPrice})`, (err: Error, res) => {
			if(err) console.error(err)
			else console.log(`[DB][INFO] Insert data to '${this.table}' table successed!`)
		})
		return invoiceOrder.hash
	}
	
}