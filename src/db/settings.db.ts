import DB from "../db"
import mysql from "mysql2"

// Interfaces for structures db tables
export interface IColor{
	id: number | null
	color: string
}

export interface IMaterial{
	id: number | null
	material: string
}


export class Colors extends DB{
	constructor(){
		super("colors")
	}
	public static queryAdder(table: string, color: IColor){ return `insert into ${table} (color) values (${color.color})` } 

	public add(color: IColor){
		this.connection.query(Colors.queryAdder(this.table, color), (err: Error, res) => {
			if(err) console.error(err)
			else console.log("[DB][INFO] Insert data to colors' table successed!")
		})
	}
	
}


export class Materials extends DB{
	constructor(){
		super("materials")
	}
	public add(material: IMaterial){
		this.connection.query(`insert into ${this.table} (material) values (${material.material})`, (err: Error, res) => {
			if(err) console.error(err)
			else console.log("[DB][INFO] Insert data to materials' table successed!")
		})
	}
}

export default class Settings{
	public colors: Colors
	public materials: Materials
	constructor(){
		this.colors = new Colors()
		this.materials = new Materials()
	}
}