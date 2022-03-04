import { Controller } from "stimulus"

export default class extends Controller {
  static target = ["markAsDoneBtn, postponeBtn, submitBtn"]

  connect() {
    console.log("yosh!");
  }

  markAsDone() {
    console.log("click! markAsDone");
  }

  postpone() {
    console.log("click! postpone");
  }

  submit() {
    console.log("click! submit");
  }

}
