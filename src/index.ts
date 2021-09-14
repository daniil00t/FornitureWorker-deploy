import express from 'express'
import cors from "cors"
import * as env from "dotenv"


import { IRoute, routes } from "./routes"

env.config({ path: __dirname + '/.env' })

// rest of the code remains same
const app = express();
const PORT = process.env.PORT;

app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

app.use(express.static('public'));
app.use(express.static('client'));


app.use(cors())


routes.map((route: IRoute) => {
  switch(route.method){
    case "POST":
      app.post(route.path, route.cb);
      break
    case "GET":
      app.get(route.path, route.cb);
      break
  }
})




app.listen(PORT, () => {
  console.log(`⚡️[server]: Server is running at https://localhost:${PORT}`);
});