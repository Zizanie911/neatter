import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["calendar"]

  connect() {
    // console.log(this.postponeBtnTarget);
    // console.log(this.calendarTarget);
  }

  toggleCalendar() {
    // console.log("toggle!");
    this.calendarTarget.classList.toggle("d-none");
  }

}
