import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "formContainer", "button", "form", "closeCross" ]

  markAsDone(event){
    // recuperer l'id de la checkbox qui vient d'etre cliquée :
    const eventTargetId = event.currentTarget.dataset.taskId;
    this.formTargets.forEach(target => {
      // Iterer sur chacune des formTarget pour trouver cellle dont le data-task-id
      // correspond à celle de la checkbox
      if (target.dataset.taskId === eventTargetId) {
        target.requestSubmit();
      }
    });
  }

  connect() {
    // console.log("task_form");
    // console.log(this.formContainerTarget);
  }

  toggleForm(event) {
    fetch(event.currentTarget.dataset.path, {
      headers: {
        accept: "text/plain"
      }
    }).then(response => response.text())
    .then((data) => {
      this.formContainerTarget.classList.remove("form-visible");
      if (this.formContainerTarget.innerHTML === "") {
        this.formContainerTarget.innerHTML = data;
        this.formContainerTarget.classList.add("form-visible");
        this.buttonTarget.classList.add("d-none");
      } else {
        setTimeout(() => {
          this.formContainerTarget.innerHTML = data;
          this.formContainerTarget.classList.add("form-visible");
        }, 150);
      }
    })
  }

  closeForm() {
    this.formContainerTarget.innerHTML = "";
    this.formContainerTarget.classList.remove("form-visible");
    this.buttonTarget.classList.remove("d-none");
  }
}
