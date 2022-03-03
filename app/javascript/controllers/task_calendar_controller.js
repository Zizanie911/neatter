import { Controller } from "stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["date"]

  connect() {
    flatpickr(this.dateTarget, {
      minDate: "today",
      inline: true,
      dateFormat: "Y-m-d",
    })
    this.dateTarget.nextElementSibling.classList.toggle('d-none')
  }

  showCalendar(){
    this.dateTarget.nextElementSibling.classList.toggle('d-none')
  }
}
