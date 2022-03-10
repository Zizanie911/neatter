import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["calendar", "markAsDoneBtn", "postponeBtn", "submitBtn"]

  connect() {
    // console.log(this.postponeBtnTarget);
    // console.log(this.calendarTarget);
  }

  markAsDone() {
    console.log("click! markAsDone");
  }

  postpone(event) {
    // Toggle class sur le calendrier (event.currentTarget)
  }

  toggleCalendar() {
    // console.log("toggle!");
    this.calendarTarget.classList.toggle("d-none");
  }

  submit() {
    console.log("click! submit");
  }

}
