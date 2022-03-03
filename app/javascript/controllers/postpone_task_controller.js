import { Controller } from "stimulus"

export default class extends Controller {
  static target = ["postponeBtn"]

  connect(){
    console.log("yosh!");
  }

  postpone(){
    console.log("click!");
  }
}
