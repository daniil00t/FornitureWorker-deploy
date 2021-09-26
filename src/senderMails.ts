import nodemailer from "nodemailer"
import { readFileSync } from "fs"
import path from "path"

interface AccountField{
	user: string
	pass: string
}

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

	sendMail(to: string, sub: string, text: string, html: string, filename: string): Promise<any>{
		return this.transporter.sendMail({
			from: '✔ sender.mails.fornitureworker@gmail.com',
			to,
			subject: sub,
			text,
			html,
			attachments: [
				{
					filename,
					content: readFileSync(path.join(__dirname, "dumps", filename))
				}
			]
		 })
	}
}