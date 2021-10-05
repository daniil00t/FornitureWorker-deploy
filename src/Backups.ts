import mysqldump from "mysqldump"
import path from "path"
import * as env from "dotenv"
import fs from "fs"
import mysql from "mysql2"

env.config({ path: path.join(__dirname, "../", "../", ".env") })

import SenderMails from "./senderMails"

interface ConnectionToDB{
	host: string
	user: string
	database: string
	password: string
}


export default class Backups{
	private conn: ConnectionToDB
	private connection: mysql.Connection

	constructor(connection: mysql.Connection){
		this.connection = connection
		this.conn = {
			host: process.env.DB_HOST!,
			user: process.env.DB_USER!,
			database: process.env.DB_NAME!,
			password: process.env.DB_PASSWORD!
		}
	}
	private sendMail = (filename: string): Promise<any> => {
		const sender = new SenderMails()
		return sender.sendMail(
			"Backup from fornitureworker",
			"Hello! It is backup, attachmenting in file below",
			"",
			filename
		)
	}

	public makeBackup(): Promise<any>{
		return new Promise((resolve, reject) => {
			const date = new Date()
			const fileName = `${date.getDate()}.${date.getMonth()}.${date.getFullYear()}_${date.getHours()}.${date.getMinutes()}.${date.getSeconds()}.dump.sql`
			mysqldump({
				connection: this.conn,
				dumpToFile: path.join(__dirname, "../", "/dumps", fileName),
			})
			.then(data => {
				this.sendMail(fileName)
				resolve({ error: false, fileName })
				
			})
			.catch(err => {
					console.log(err)
					reject({ error: true })
				}
			)
		})
	}

	public autoBackup(){
		const DEFAULT_DATE = Date.parse("10.01.2021") // 1 October
		const every_days_count = 3
		const epsilon = 0.02
		const hour_in_milliseconds = 3600000

		// every one hour check with would make need backup
		const check = () => {
			const now = new Date().getTime()
			console.log((now - DEFAULT_DATE) / (every_days_count * 86400000) % 1)
			return (now - DEFAULT_DATE) / (every_days_count * 86400000) % 1 < epsilon
		}
		
		setInterval(() => {
			if(check()){
				this.makeBackup()
			}
		}, hour_in_milliseconds)
	}
	public toBackup(dumpFileName: string, callback: (err: Error, data: any[]) => void){
		const body = fs.readFileSync(path.join(__dirname, "../", "/dumps", dumpFileName)).toString()
		const queryInit = `DROP DATABASE IF EXISTS ${process.env.DB_NAME!};
								CREATE DATABASE ${process.env.DB_NAME!};
								USE ${process.env.DB_NAME!};\n` + body

		this.connection.query(queryInit, callback)
	}

	public getBackups(): string[]{
		return fs.readdirSync(path.join(__dirname, "../", "/dumps"))
	}
	
}