import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  }

  toggleRow(event) {
    const trId = event.currentTarget.dataset.trId;
    const hiddenRow = document.getElementById(trId);
    if (hiddenRow) {
      if (hiddenRow.classList.contains("d-none")) {
        hiddenRow.classList.remove("d-none");
      } else {
        hiddenRow.classList.add("d-none");
      }
    }
  }
}
