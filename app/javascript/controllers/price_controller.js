import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "startDate", "endDate" , "calculatedPrice", "priceField"]

  connect() {
    console.log('Hello, Stimulus!');
    this.rate = this.data.get("rate");
  }

  update(event) {
    const start = Date.parse(this.startDateTarget.value);
    const end = Date.parse(this.endDateTarget.value);
    if (!Number.isNaN(start) && !Number.isNaN(end)) {
      const hours = (end - start) / 3600000
      const finalPrice = Math.round(hours * this.rate)
      this.calculatedPriceTarget.innerHTML = `£${finalPrice}`
      this.priceFieldTarget.value = finalPrice
    } else {
      this.calculatedPriceTarget.innerHTML = ""
      this.priceFieldTarget.value = null
    }
  }
}
