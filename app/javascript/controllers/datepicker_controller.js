import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {

    flatpickr("#dateRangePicker", {
      mode: "range",
      dateFormat: "Y-m-d",
      minDate: "today",
      disable: [
        function(date) {
          // disable every multiple of 8
          return !(date.getDate() % 8);
        }
      ]
    });
  }
}
