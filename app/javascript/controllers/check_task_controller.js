import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "submitBtn" ]

  connect() {
    console.log('connect!');
  }

  submit() {
    this.submitBtnTarget.click();
    console.log('click!');
  }
}
