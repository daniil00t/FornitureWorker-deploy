import nodemailer from "nodemailer"
import { readFileSync } from "fs"
import path from "path"
import * as env from "dotenv"

env.config({ path: path.join(__dirname, ".env") })

export default class SenderMails{
	private transporter: nodemailer.Transporter
	private test: nodemailer.TestAccount | null = null
	constructor(){
		// nodemailer.createTestAccount()
		// 	.then(test => this.test = test)

		this.transporter = nodemailer.createTransport({
			service: 'gmail',
			auth: {
				type: 'OAuth2',
				user: process.env.MAIL_USERNAME,
				clientId: process.env.OAUTH_CLIENTID,
				clientSecret: process.env.OAUTH_CLIENT_SECRET,
				refreshToken: process.env.OAUTH_REFRESH_TOKEN
			}
		 })
	}

	sendMail(sub: string, text: string, html: string, filename: string): Promise<any>{
		return this.transporter.sendMail({
			from: `📟 ${process.env.MAIL_USERNAME}`,
			to: process.env.TO_EMAIL,
			subject: sub,
			text,
			html,
			attachments: [
				{
					filename,
					content: readFileSync(path.join(__dirname, "../", "dumps", filename))
				}
			]
		})
			.then(val => console.log(val))
			.catch(err => console.log(err))
	}
}