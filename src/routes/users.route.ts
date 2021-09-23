import mysql from "mysql2"
import Users from "../db/user.db"
import express from "express"


enum EURole{
	ADMIN = 0,
	EDITOR = 1,
	USER = 4,
	NONE = 999
}

type expresscb = (req: express.Request, res: express.Response) => void

export default class ROUTE__Users{
	private userInstance: Users
	constructor(){
		this.userInstance = new Users()
	}

	// --------------------------------------------------------------------------
	// ------------------------------- Methods ----------------------------------
	// --------------------------------------------------------------------------

	public checkAuth(token: string){
		interface IGUser{
			login: string,
			password: string
		}

		return new Promise((resolve, reject) => {
			let auth: boolean = false
			// Get all users from tables
			var decoded = this.userInstance.decodeToken(token) as IGUser
			this.userInstance.findRowByCol("login", decoded.login, (users: any[]) => {
				if(users.length === 0) reject({ error: false })
				else{
					const user = users[0]
					if(decoded.password === (this.userInstance.decodeToken(user.jwt) as IGUser).password) 
						resolve({
							...Object.keys(user)
								.filter((key: string) => ["login", "name", "role", "active"].includes(key))
								.reduce((prev: any, key: any) => { prev[key] = user[key]; return prev }, {}),
							error: false
						})
					else reject({ error: true })
				}
			})
		})
	}

	public authMiddleware = (req: express.Request, res: express.Response, next: expresscb, accessRole: number = EURole.NONE) => {
		const token = req.query.token || req.body.token || null
	
		interface IGUser{
			login: string,
			password: string
		}
	
		if(Boolean(token)){
			new Promise((resolve, reject) => {
				let auth: boolean = false
				// Get all users from tables
				var decoded = this.userInstance.decodeToken(token) as IGUser
				this.userInstance.findRowByCol("login", decoded.login, (users: any[]) => {
					if(users.length === 0) reject({ error: false, errorMessage: "Error: token is not correct" })
					else{
						const user = users[0]
						if(decoded.password === (this.userInstance.decodeToken(user.jwt) as IGUser).password){
							if(user.role <= accessRole) resolve({ error: false })
							else reject({ error: true, errorMessage: "Error: not enough access rights" })
						}
							
						else reject({ error: true, errorMessage: "aboba" })
					}
				})
			})
				.then((response: any) => !response.error && next(req, res))
				.catch(err => res.json({ error: true, errorMessage: err.errorMessage }))
		}
		else res.json({ error: true, errorMessage: "Error: token is empty" })
	}

	public allUsersCallback = (req: express.Request, res: express.Response) => {
		console.log(req.query)
		console.log(this.userInstance)
		this.userInstance.getAll((_res) => {
			res.json({ data: _res })
		})
	}

	public registrationCallback = (req: express.Request, res: express.Response) => {
		const data = req.body
	
		this.userInstance.add({
			name: data.name,
			login: data.login,
			jwt: this.userInstance.generateToken(data.login, data.password),
			date_created: `${new Date().getFullYear()}-${new Date().getMonth()}-${new Date().getDay()}`,
			role: +data.role
		})
	
		res.json({ jwt: this.userInstance.generateToken(data.login, data.password) })
	}

	public loginCallback = (req: express.Request, res: express.Response) => {
		const data = req.body
	
		interface IGUser{
			login: string,
			password: string
		}
	
		new Promise((resolve, reject) => {
			// var decoded = userInstance.decodeToken(user.jwt) as IGUser;
			this.userInstance.findRowByCol("login", data.login, (users) => {
				if(users.length === 0) reject({ error: true })
				else{
					const user = users[0]
					try{
						if(data.password === (this.userInstance.decodeToken(user.jwt) as IGUser).password){
							resolve({ 
								error: false,
								...Object.keys(user)
									.filter((key: string) => ["login", "name", "role", "active", "jwt"].includes(key))
									.reduce((prev: any, key: any) => { prev[key] = user[key]; return prev }, {})
							})
						}
						else reject({ error: true, errorMessage: "login or password are not correct" })
					}
					catch(err) { reject({ error: true, errorMessage: "login or password are not correct" }) }
				}
			})
		})
			.then(data => res.json(data))
			.catch(err => res.json(err))
	}

	public authCallback = (req: express.Request, res: express.Response) => {
		const token = req.body.token
	
		interface IGUser{
			login: string,
			password: string
		}
		this.checkAuth(token).then((data: any) => {
			console.log("OKEY", data)
			res.json({
				...data,
				jwt: this.userInstance.generateToken((this.userInstance.decodeToken(token) as IGUser).login, (this.userInstance.decodeToken(token) as IGUser).password)
			})
		}).catch((err: Error) => res.json({ error: true, errorMessage: "error on server" }))
	}

	public saveUsersCallback = (req: express.Request, res: express.Response) => {
		const data = req.body
		this.userInstance.save(data.data, false)
			.then(d => !d.error && res.json({ error: false }))
			.catch(err => res.json({ error: true, opt: err }))
		
	}
}