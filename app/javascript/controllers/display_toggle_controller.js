import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dayElement", "optionElement", "calendarOptionElement"]

  connect() {
  }

  toggleClassForHabits() {
    this.dayElementTargets.forEach(element => element.classList.toggle("d-none"));
  }

  toggleClassOptions() {
    console.log("click!")
    this.optionElementTarget.classList.toggle("d-none");
  }

  toggleClassCalendarOptions() {
    console.log("click!")
    this.calendarOptionElementTarget.classList.toggle("d-none");
  }

}
