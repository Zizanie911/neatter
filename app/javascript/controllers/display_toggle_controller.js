import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dayElement"]

  connect() {
  }

  toggleClassForHabits() {
    this.dayElementTargets.forEach(element => element.classList.toggle("d-none"));
  }

}
