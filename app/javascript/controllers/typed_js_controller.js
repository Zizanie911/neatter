import { Controller } from "@hotwired/stimulus"
// Don't forget to import the NPM package
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["A neatter way to organise your day.", "Focus on today.", "See what's important.", "No more overwhelm."],
      typeSpeed: 50,
      loop: true
    });
  }
}
