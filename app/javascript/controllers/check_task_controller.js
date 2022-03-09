import { Controller } from "stimulus"
import { annotate } from 'rough-notation';

export default class extends Controller {
  static targets = [ "submitBtn", "taskName" ]

  submit() {
    this.element.submit();
    annotate(taskNameTarget, { type: 'strike-through' }).show();
  }
}
