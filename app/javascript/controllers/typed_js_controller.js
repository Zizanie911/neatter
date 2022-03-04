import { Controller } from "@hotwired/stimulus"
// Don't forget to import the NPM package
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["A neater way to organise your day.", "Get a clearer view", "Do what's important"],
      typeSpeed: 50,
      loop: true
    });
  }
}
