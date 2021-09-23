import mysql from "mysql2"
import * as env from "dotenv"
import path from "path"

import Settings, { IColor, IMaterial, Colors } from "./db/settings.db"
import e from "express"


env.config({ path: path.join(__dirname, "..", ".env") })

interface IPayloadAction{
	id: number,
	col?: string,
	value?: string,
	ids?: number[]
}

interface IAction{
	type: "CHANGE" | "NEW_ROW" | "DELETE_ROW",
	payload: IPayloadAction
}


export const connection = mysql.createConnection({
	multipleStatements: true,
	host: process.env.DB_HOST,
	user: process.env.DB_USER,
	database: process.env.DB_NAME,
	password: process.env.DB_PASSWORD
})

export default class DB{

	public connection: mysql.Connection
	public table: string

	constructor(table: string){
		this.table = table
		this.connection = connection
	}


	// GET
	public getAll(cb: (res: any[]) => void, year?: number){
		let query = ""
		if(year !== undefined)
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


	public update(setCol: string, setValue: string, id: number, callback?:  (err: Error, res: any[]) => void){
		const _callback = (err: Error, res: any[]) => {
			if(err) console.error(err)
		}

		if(!!Number(setValue))
			this.connection.query(
				`UPDATE ${this.table} SET ${setCol} = ${setValue} WHERE id = ${id}`,
				callback !== undefined? callback!: _callback
			)
		else
			this.connection.query(
				`UPDATE ${this.table} SET ${setCol} = "${setValue}" WHERE id = ${id}`, 
				callback !== undefined? callback!: _callback
			)
	}

	public updateByHASH(setCol: string, setValue: string, hash: string, callback?:  (err: Error, res: any[]) => void){
		const _callback = (err: Error, res: any[]) => {
			if(err) console.error(err)
		}

		if(!!Number(setValue))
			this.connection.query(
				`UPDATE ${this.table} SET ${setCol} = ${setValue} WHERE hash = "${hash}"`,
				callback !== undefined? callback!: _callback
			)
		else
			this.connection.query(
				`UPDATE ${this.table} SET ${setCol} = "${setValue}" WHERE hash = "${hash}"`, 
				callback !== undefined? callback!: _callback
			)
	}

	public updateByAny(setCol: string, setValue: string, smtCol: string, smtValue: string, callback?:  (err: Error, res: any[]) => void){
		const _callback = (err: Error, res: any[]) => {
			if(err) console.error(err)
		}
		const query = `UPDATE ${this.table} SET ${setCol} = ${!!Number(setValue) ? setValue: `"${setValue}"`}
		WHERE ${smtCol} = ${!!Number(smtValue) ? smtValue: `"${smtValue}"`}`
		
		console.log(query)
		this.connection.query(
			query, callback !== undefined? callback!: _callback
		)
	}

	public save(data: IAction[], dep: boolean, callback?: (data: IAction, _hash: string) => void): Promise<any>{
		let actionsLen = data.length
		return new Promise((resolve, reject) => {
			data.map((action: IAction) => {
				try{
					switch(action.type){
						case "NEW_ROW":
							const id = action.payload.id

							const changes = data
								.filter((action: IAction) => 
									action.type === "CHANGE" &&
									action.payload.id === id)
								.reduce((prev: object, curr: IAction) => { return {...prev, [curr.payload.col!]: curr.payload.value} }, {})
							data = data.filter((action: IAction) => action.payload.id != id)
							actionsLen = data.length - 1
							
							switch(this.table){
								case "colors":
									var emptyColors: IColor = { id: null, color: "" }
									const color = { ...emptyColors, ...changes }
									this.connection.query(`insert into colors (color) values ("${color.color}")`)
									break
								case "materials":
									var emptyMaterials: IMaterial = { id: null, material: "" }
									const material = { ...emptyMaterials, ...changes }

									this.connection.query(`insert into materials (material) values ("${material.material}")`)
									break
							}
							break
		
						case "CHANGE":
							if(dep){
								this.update(action.payload.col!, action.payload.value!, action.payload.id, (err: Error, res: any[]) => {
									this.findRowByCol("id", ""+action.payload.id, (res) => {
										callback!(action, res[0].hash)
									})
								})
								actionsLen--
							}
							else{
								this.update(action.payload.col!, action.payload.value!, action.payload.id)
								actionsLen--
							}
							break
						case "DELETE_ROW":
							action.payload.ids!.map(id => { this.deleteById(id) })
							
							actionsLen--
							break
						default:
							console.log("Undefined case")	
					}
				}
				catch(err){
					reject(err)
				}
				if(actionsLen == 0) resolve({ error: false })
			})
			resolve({ error: false })
		})
	}

	// DELETE
	public deleteById(id: number){
		this.connection.query(`delete from ${this.table} where id = ${id}`, (err: Error, res) => {
			if(err) console.error(err)
		})
	}
	public deleteByHASH(hash: string){
		this.connection.query(`delete from ${this.table} where hash = "${hash}"`, (err: Error, res) => {
			if(err) console.error(err)
		})
	}
}