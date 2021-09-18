import jwt from "jsonwebtoken"
import DB from "../db"
import path from "path"
import { readFileSync } from "fs"
import mysql from "mysql2"

enum ERole {
	ADMIN = 0,
	EDITOR,
	MODERATOR,
	USER,

	// for non-authorization users
	NON = 999
}

export interface IUser{
	id?: number,
	login: string,
	jwt: string,
	name: string,
	date_created: string,
	role: ERole,
	description?: string,
	active?: number
}


class Users extends DB{
	private readonly privateKey: string
	constructor(){
		super("users")
		this.privateKey = readFileSync(path.join(__dirname, "../", "../", "private.key")).toString()
	}
	public generateToken(login: string, password: string){
		return jwt.sign({ login: login, password: password }, this.privateKey, { algorithm: 'HS256' })
	}

	public decodeToken(token: string): Object{
		return jwt.verify(token, this.privateKey) as Object
	}

	public add(user: IUser){
		this.connection.query(`insert into ${this.table} (id, jwt, login, name, date_created, role, description, active) values (null, "${user.jwt}", "${user.login}", "${user.name}", "${user.date_created}", ${user.role}, "${user.description}", 0)`, (err: Error, res) => {
			if(err) console.error(err)
			else console.log("[DB][INFO] Insert data to users' table successed!")
		})
	}
}

export default Users