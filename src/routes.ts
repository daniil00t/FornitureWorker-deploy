import express from "express"
import path from "path"


import ROUTE__Users from "./routes/users.route"
import ROUTE__Invoices from "./routes/invoices.route"
import ROUTE__Orders from "./routes/orders.route"
import ROUTE__Settings from "./routes/settings.route"


// ROUTES classes

const ROUTES__UserInstance: ROUTE__Users = new ROUTE__Users()
const ROUTES__InvoicesInstance: ROUTE__Invoices = new ROUTE__Invoices()
const ROUTES__OrdersInstance: ROUTE__Orders = new ROUTE__Orders()
const ROUTES__SettingsInstance: ROUTE__Settings = new ROUTE__Settings()

ROUTES__SettingsInstance.backupsInstance.autoBackup()


type expresscb = (req: express.Request, res: express.Response) => void

export interface IRoute{
	path: string,
	name: string,
	method: "POST" | "GET",
	isPrivate: boolean,
	cb: expresscb
}

enum EURole{
	ADMIN = 0,
	EDITOR = 1,
	USER = 4,
	NONE = 999
}



const getColorsCallback = (req: express.Request, res: express.Response) => {
	res.json({
		error: false,
		data: [
			{ id: 1, color: "венге-1" },
			{ id: 2, color: "венге-2" },
			{ id: 3, color: "венге-3" },
		]
	})
}

const homeCallback = (req: express.Request, res: express.Response) => {
	res.sendFile(path.join(__dirname, "../", "client", "index.html"))
}





export const routes: IRoute[] = [
	// --------------------------------------------------------------------------
	// ------------------------------- PRIVATE ----------------------------------
	// --------------------------------------------------------------------------
	{
		path: "/get_number_order",
		name: "Get counter number order",
		method: "GET",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__OrdersInstance.getNumberOrderCallback, EURole.USER)
	},
	{
		path: "/save_data/prod",
		name: "Save data from prod table",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__OrdersInstance.saveProdCallback, EURole.EDITOR)
	},
	{
		path: "/save_data/control",
		name: "Save data from control table",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__OrdersInstance.saveControlCallback, EURole.EDITOR)
	},
	{
		path: "/save_data/users",
		name: "Save data from users table",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__UserInstance.saveUsersCallback, EURole.ADMIN)
	},
	{
		path: "/save_data/invoice",
		name: "Save data from invoice table",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__InvoicesInstance.saveInvoiceCallback, EURole.USER)
	},
	{
		path: "/new_invoice_deliver_back",
		name: "New order when we want create deliver back",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(
				req, 
				res, 
				ROUTES__InvoicesInstance.newInovoiceDeliverBackCallback, 
				EURole.USER
			)
	},
	{
		path: "/get_invoice",
		name: "get invoice",
		method: "GET",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => 
		ROUTES__UserInstance.authMiddleware(req, res, ROUTES__InvoicesInstance.getInvoiceDOCXCallback, EURole.USER)
	},
	{
		path: "/new_order",
		name: "New Order",
		method: "POST",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) =>
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__OrdersInstance.newOrderCallback, EURole.USER)
	},
	{
		path: "/orders",
		name: "All Orders",
		method: "GET",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__OrdersInstance.allOrdersCallback, EURole.USER)
	},
	{
		path: "/invoices",
		name: "All Invoices",
		method: "GET",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__InvoicesInstance.allInvoicesCallback, EURole.USER)
	},
	{
		path: "/users",
		name: "All Orders",
		method: "GET",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__UserInstance.allUsersCallback, EURole.ADMIN)
	},
	{
		path: "/get_colors",
		name: "All Colors",
		method: "GET",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__SettingsInstance.getColors, EURole.ADMIN)
	},
	{
		path: "/save_data/colors",
		name: "Save Colors",
		method: "POST",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => 
		ROUTES__UserInstance.authMiddleware(req, res, ROUTES__SettingsInstance.saveColors, EURole.ADMIN)
	},
	{
		path: "/get_materials",
		name: "All Colors",
		method: "GET",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__SettingsInstance.getMaterials, EURole.EDITOR)
	},
	{
		path: "/save_data/materials",
		name: "Save Materials",
		method: "POST",
		isPrivate: false,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__SettingsInstance.saveMaterials, EURole.EDITOR)
	},

	// System Routes
	{
		path: "/make_backup",
		name: "Make backup",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__SettingsInstance.makeBackup, EURole.ADMIN)
	},
	{
		path: "/get_backups",
		name: "Get backups",
		method: "GET",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__SettingsInstance.getBackups, EURole.ADMIN)
	},
	{
		path: "/to_backup",
		name: "Roll to previous backup",
		method: "POST",
		isPrivate: true,
		cb: (req: express.Request, res: express.Response) => 
			ROUTES__UserInstance.authMiddleware(req, res, ROUTES__SettingsInstance.toBackup, EURole.ADMIN)
	},

	// --------------------------------------------------------------------------
	// ------------------------------- PUBLIC -----------------------------------
	// --------------------------------------------------------------------------

	{
		path: "/registration",
		name: "Registration a new user",
		method: "POST",
		isPrivate: false,
		cb: ROUTES__UserInstance.registrationCallback
	},
	{
		path: "/login",
		name: "Login a user",
		method: "POST",
		isPrivate: false,
		cb: ROUTES__UserInstance.loginCallback
	},
	{
		path: "/auth",
		name: "Authentication a user",
		method: "POST",
		isPrivate: false,
		cb: ROUTES__UserInstance.authCallback
	},
	
	{
		path: "/",
		name: "Client App",
		method: "GET",
		isPrivate: false,
		cb: homeCallback
	},
	{
		path: "*",
		name: "Client App",
		method: "GET",
		isPrivate: false,
		cb: homeCallback
	}
]