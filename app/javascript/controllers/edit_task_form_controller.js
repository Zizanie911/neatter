import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "formContainer" ]

  connect() {
    console.log("test");
    // console.log(this.formContainerTarget);
  }

  toggleForm(e) {
    e.preventDefault();
    console.log("toggle");
    this.formContainerTarget.classList.toggle("d-none")
  }
}
