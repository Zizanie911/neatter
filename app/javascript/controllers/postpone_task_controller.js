import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["markAsDoneBtn", "postponeBtn", "submitBtn"]

  connect() {
    console.log(this.postponeBtnTarget);
  }

  markAsDone() {
    console.log("click! markAsDone");
  }

  postpone(event) {
    // Toggle class sur le calendrier (event.currentTarget)
  }

  submit() {
    console.log("click! submit");
  }

}
