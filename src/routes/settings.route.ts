import mysql from "mysql2"
import Settings, { Colors, Materials} from "../db/settings.db"
import express from "express"
import mysqldump from 'mysqldump'
import * as env from "dotenv"
import path from "path"
import fs from "fs"

env.config({ path: path.join(__dirname, "../", "../", ".env") })


export default class ROUTE__Settings{
	private settings: Settings
	private colors: Colors
	private materials: Materials
	private connection: mysql.Connection
	constructor(){
		this.settings = new Settings()
		this.colors = new Colors()
		this.materials = new Materials()
		this.connection = this.colors.connection
	}

	// --------------------------------------------------------------------------
	// ------------------------------- Colors -----------------------------------
	// --------------------------------------------------------------------------

	public getColors = (req: express.Request, res: express.Response) => {
		this.colors.getAll(data => res.json({ data, error: false }) )
	}

	public saveColors = (req: express.Request, res: express.Response) => {
		console.log(req.body.changes)
		this.colors.save(req.body.changes, false)
			.then((data) => res.json({ error: false }))
			.catch((err) => res.json({ error: true }))
	}

	// --------------------------------------------------------------------------
	// ------------------------------- Materials --------------------------------
	// --------------------------------------------------------------------------

	public getMaterials = (req: express.Request, res: express.Response) => {
		this.settings.materials.getAll((materials) => res.json({ data: materials, error: false }))
	}
	public saveMaterials = (req: express.Request, res: express.Response) => {
		this.materials.save(req.body.changes, false)
			.then((data) => res.json({ error: false }))
			.catch((err) => res.json({ error: true }))
	}

	// --------------------------------------------------------------------------
	// ------------------------------- Backups ----------------------------------
	// --------------------------------------------------------------------------

	public makeBackup = (req: express.Request, res: express.Response) => {
		const date = new Date()
		const fileName = `${date.getDate()}.${date.getMonth()}.${date.getFullYear()}_${date.getHours()}.${date.getMinutes()}.${date.getSeconds()}.dump.sql`
		mysqldump({
			connection: {
				host: process.env.DB_HOST,
				user: process.env.DB_USER!,
				database: process.env.DB_NAME!,
				password: process.env.DB_PASSWORD!
			},
			// dumpToFile: `./${new Date().toJSON()}.dump.sql`,
			dumpToFile: path.join(__dirname, "../", "../", "/dumps", fileName),
	  }).then((data) => res.json({ error: false, fileName }))
	  	.catch(err => {

			  console.log(err)
			  res.json({ error: true })
		  }
		)
	}

	public getBackups = (req: express.Request, res: express.Response) => {
		res.json({ data: fs.readdirSync(path.join(__dirname, "../", "../", "/dumps")) })
	}

	public toBackup = (req: express.Request, res: express.Response) => {
		const dumpFileName = req.body.fileName
		const body = fs.readFileSync(path.join(__dirname, "../", "../", "/dumps", dumpFileName)).toString()
		const queryInit = `DROP DATABASE IF EXISTS ${process.env.DB_NAME!};
								CREATE DATABASE ${process.env.DB_NAME!};
								USE ${process.env.DB_NAME!};\n` + body

		this.connection.query(queryInit,(err: Error, data: any[]) => {
			if(err) {
				console.log(err)
				res.json({ error: true, errorMessage: err.message })
			}
			else {
				console.log(data)
				res.json({ data, error: false })
			}
		})
	}
}