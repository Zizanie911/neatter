import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "submitBtn" ]

  submit() {
    this.element.submit();
  }
}
