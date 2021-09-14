import 'reflect-metadata'

import { FillfulmentControlOrder, CounterWeek } from "./orders.db"


export class OrderCounter {
	private currentNumberOrder: number
	private counterWeek: CounterWeek
	private offset: number

	constructor(ff: FillfulmentControlOrder, counterWeek: CounterWeek){
		this.currentNumberOrder = 0
		this.counterWeek = counterWeek
		// mind counter
		this.offset = 0
		
	}

	public updateCount(newCount: string, id: number){
		this.counterWeek.update("count", newCount, id)
	}


	public getNumberOrder(week: number, year: number): Promise<number>{
		return new Promise((resolve, reject) => {
			if(!!Number(week)){
				this.counterWeek.findRowByCols(["week", "year"], [""+week, ""+year], (res: any[]) => {
					if(res.length === 0){
						this.counterWeek.add({week: week, count: 0, year: year})
						// this.updateCount(res[0].count + 1, res[0].id)
						resolve(Number("" + week + "00"))
					}else{
						let count = res[0].count
						const id = res[0].id
	
						this.updateCount(count + 1, id)
						resolve(Number(week + (Math.floor(+(count + 1) / 10) < 1? "0"+(count + 1): ""+(count + 1) )))
					}
				})
			}
			else{
				reject(new Error("Week isn't number!"))
			}
			
		})
	}
}