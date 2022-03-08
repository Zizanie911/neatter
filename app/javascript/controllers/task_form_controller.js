import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "formContainer" ]

  connect() {
    // console.log("task_form");
    // console.log(this.formContainerTarget);
  }

  toggleForm() {
    console.log("toggle");
    this.formContainerTarget.classList.toggle("form-visible");
  }

}
