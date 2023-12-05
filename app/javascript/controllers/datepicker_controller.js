import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
// import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [ "begin_at", "end_at" ]
  // static values = {
  //       disabledStartDate: Array
  //       }


  connect() {
    // console.log(this.disabledStartDateValue)
    flatpickr(this.begin_atTarget, {
      mode: "range",
      dateFormat: "d-m-Y",
      minDate: "today"
      // disable: this.disabledStartDateValue
    })
  }


  send(){
    const startDate = this.begin_atTarget.value.split(" to ")[0]
    const endDate = this.begin_atTarget.value.split(" to ")[1]
    this.end_atTarget.value = endDate
    this.begin_atTarget.value = startDate
  }
}
