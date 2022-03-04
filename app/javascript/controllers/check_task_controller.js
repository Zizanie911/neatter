import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "submitBtn" ]

  submit() {
    console.log("test")
    this.submitBtnTarget.click();
  }
}
