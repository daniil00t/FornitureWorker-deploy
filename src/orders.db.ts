import { DB } from "./db"
import mysql from "mysql2"
import 'reflect-metadata'


interface IProductionOrders{
	id?: number,
	id_fc: number,
	name: string,
	count: number,
	week: number,
	material: string,
	color: string,
	year: number,

   status?: string,
	date_created: string,
	description?: string,
	id_added_user: number
}

interface IFillfulmentControlOrder{
	id?: number,
	id_fc: number,
	week: number,
	site_name: string,
	date_order: string,
	client_phone: string,
	client_name?: string,
	client_address?: string,
	price: number,
	status?: string,
	paid?: number,
	date_created: string,
	year: number,

	delivery?: number,
	assembly?: number,
	entering?: number,
	assemblyAndEntering?: number,

	delivery_price?: number,
	assembly_price?: number,
	entering_price?: number,
	assemblyAndEntering_price?: number
}

interface ICounterWeek{
	id?: number,
	week: number,
	count: number,
	year: number
}


export class ProductionOrders extends DB {
	constructor(connection: mysql.Connection){
		super("production_order", connection)
	}

	public add(order: IProductionOrders){
		this.connection.query(`insert into ${this.table} (id, id_fc, name, count, week, material, color, year, status, date_created, description, id_added_user) values (null, ${order.id_fc}, "${order.name}", ${order.count}, ${order.week}, "${order.material}",  "${order.color}", ${order.year}, "В работе", "${order.date_created}", "${order.description}", ${order.id_added_user})`, (err: Error, res) => {
			if(err) console.error(err)
		})
	}
	
}


export class FillfulmentControlOrder extends DB {
	constructor(connection: mysql.Connection){
		super("fillfulment_control_order", connection)
	}

	public add(order: IFillfulmentControlOrder, cb?: (err: Error, result: any) => void){
		this.connection.query(`insert into ${this.table} (id, id_fc, week, site_name, date_order, date_created, client_phone, client_name, client_address, price, status, paid, year, delivery, assembly, entering, assemblyAndEntering,  delivery_price, assembly_price, entering_price, assemblyAndEntering_price) 
		values (null, ${order.id_fc}, ${order.week}, "${order.site_name}", "${order.date_order}", "${order.date_created}", "${order.client_phone}", "${order.client_name}", "${order.client_address}", ${order.price}, "В работе", 0, ${order.year}, ${order.delivery}, ${order.assembly}, ${order.entering}, ${order.assemblyAndEntering}, ${order.delivery_price}, ${order.assembly_price}, ${order.entering_price}, ${order.assemblyAndEntering_price})`, (err: Error, res: any) => {
			if(err) console.error(err)
		})
	}
}


export class CounterWeek extends DB{
	constructor(connection: mysql.Connection){
		super("forming_number_order", connection)
	}

	public add(counter: ICounterWeek, cb?: (err: Error, result: any) => void){
		this.connection.query(`insert into ${this.table} (id, week, count, year) values (null, ${counter.week}, ${counter.count}, ${counter.year})`, (err: Error, res: any) => {
			if(err) console.error(err)
		})
	}
}