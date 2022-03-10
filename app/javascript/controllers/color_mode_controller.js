import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello light mode")
  }

  toggleColor(event) {
    console.log(event)
    console.log(this.element);
    document.body.classList.toggle("light-mode")
  }

}
