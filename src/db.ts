import mysql from "mysql2"
import 'reflect-metadata'

interface IEditing{
	id: number,
	col: string,
	value: string
}

export class DB{

	protected readonly connection: mysql.Connection
	public table: string

	constructor(table: string, connection: mysql.Connection){
		this.table = table
		this.connection = connection
	}

	// GET
	public getAll(cb: (res: any[]) => void, year?: number){
		let query = ""
		if(Boolean(year))
			query = `SELECT * FROM ${this.table} where date_created >= "${year}-01-01"`

		else
			query = `SELECT * FROM ${this.table}`

		
		this.connection.query(query, (err: Error, res: any[]) => {
			if(err) console.error(err)
			else cb(res)
		})
	}

	public getLastRowByCol(column: string, cb: (res: number) => void){
		this.connection.query(`SELECT ${column} FROM ${this.table} ORDER BY ${column} DESC LIMIT 1`, (err: Error, res: any[]) => {
			cb(Number(res[0][column]))
		})
	}
	public findRowByCol(col: string, value: string, cb: (res: any[]) => void){
		this.connection.query(`SELECT * FROM ${this.table} WHERE ${col} = "${value}"`, (err: Error, res: any[]) => {
			if(err) console.error(err)
			else cb(res)
		})
	}

	public findRowByCols(cols: string[], values: string[], cb: (res: any[]) => void){
		let query = `SELECT * FROM ${this.table} WHERE`
		let conditionals: string[] = []
		cols.map((col, index) => {
			if(!!Number(values[index]))
				conditionals.push(` ${col} = ${values[index]} `)
			else conditionals.push(` ${col} = "${values[index]}" `)
		})
		query += conditionals.join("AND")

		this.connection.query(query, (err: Error, res: any[]) => {
			if(err) console.error(err)
			else cb(res)
		})
	}
	
	public findRowsByCol(col: string, values: string[], cb: (res: any[]) => void){
		let query = `SELECT * FROM ${this.table} WHERE`
		let conditionals: string[] = []
		values.map(value => {
			if(!!Number(value))
				conditionals.push(` ${col} = ${value} `)
			else conditionals.push(` ${col} = "${value}" `)
		})
		query += conditionals.join("OR")

		this.connection.query(query, (err: Error, res: any[]) => {
			if(err) console.error(err)
			else cb(res)
		})
	}
	// UPDATE
	public update(setCol: string, setValue: string, id: number){
		const callback = (err: Error, res: any[]) => {
			if(err) console.error(err)
		}

		if(!!Number(setValue))
			this.connection.query(`UPDATE ${this.table} SET ${setCol} = ${setValue} WHERE id = ${id}`, callback)
		else
			this.connection.query(`UPDATE ${this.table} SET ${setCol} = "${setValue}" WHERE id = ${id}`, callback)
			
	}

	public save(data: IEditing[]){
		data.map((change: IEditing) => {
			this.update(change.col, change.value, change.id)
		})
	}

	// DELETE
	public deleteById(id: number){
		this.connection.query(`delete from ${this.table} where id = ${id}`, (err: Error, res) => {
			if(err) console.error(err)
		})
	}
}