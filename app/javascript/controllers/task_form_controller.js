import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "formContainer", "button" ]

  connect() {
    // console.log("task_form");
    // console.log(this.formContainerTarget);
  }

  toggleForm(event) {
    if (event.currentTarget.classList.contains('add-button') && this.formContainerTarget.classList.contains('form-visible')) {
      this.formContainerTarget.classList.remove("form-visible");
      this.formContainerTarget.innerHTML = "";
      event.currentTarget.querySelector('i').style.transform = "rotate(0deg)";
    } else {
      this.buttonTarget.querySelector('i').style.transform = "rotate(45deg)";
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
        } else {
          setTimeout(() => {
            this.formContainerTarget.innerHTML = data;
            this.formContainerTarget.classList.add("form-visible");
          }, 150);
        }
      })
    }
  }
}
