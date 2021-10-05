import mysql from "mysql2"
import express from "express"
import * as env from "dotenv"
import path from "path"

import Settings, { Colors, Materials} from "../db/settings.db"

import Backups from "../Backups"

env.config({ path: path.join(__dirname, "../", "../", ".env") })


export default class ROUTE__Settings{
	private settings: Settings
	private colors: Colors
	private materials: Materials
	public backupsInstance: Backups

	constructor(){
		this.settings = new Settings()
		this.colors = new Colors()
		this.materials = new Materials()
		this.backupsInstance = new Backups(this.colors.connection)
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
		this.backupsInstance.makeBackup()
			.then(data => {
				res.json(data)
				}
			)
			.catch(err => res.json(err))
	}

	public getBackups = (req: express.Request, res: express.Response) => {
		res.json({ data: this.backupsInstance.getBackups() })
	}

	public toBackup = (req: express.Request, res: express.Response) => {
		this.backupsInstance.toBackup(req.body.fileName, (err: Error, data: any[]) => {
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