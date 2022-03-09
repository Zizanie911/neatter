import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dayElement", "optionElement", "calendarOptionElement", "priorityElement", "priorityStar", "tagOptionElement"]

  connect() {
  }

  toggleClassForHabits(event) {
    console.log(event.currentTarget);
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

  toggleClassTagOptions() {
    console.log("click!")
    this.tagOptionElementTarget.classList.toggle("d-none");
  }



  toggleClassPriority() {
    this.priorityStarTarget.classList.toggle("fas");
    this.priorityStarTarget.classList.toggle("far");
    this.priorityStarTarget.classList.toggle("color-yellow");
    this.priorityElementTarget.checked = !this.priorityElementTarget.checked;
  }

}
