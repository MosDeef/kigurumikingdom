import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
 static targets = ["price","duration","total"]
  connect() {
    console.log("hello")
  }
  calculate(){
    console.log(this.durationTarget.value)
    console.log(this.priceTarget.innerText)
    console.log(this.totalTarget.innerText)
    this.totalTarget.innerText=this.durationTarget.value*parseInt(this.priceTarget.innerText,10)
  }
}
