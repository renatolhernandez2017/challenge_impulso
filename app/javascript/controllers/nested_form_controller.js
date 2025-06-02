import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "container", "wrapper"]
  static values = { modelName: String }

  addAssociation(event) {
    event.preventDefault()
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.containerTarget.insertAdjacentHTML("beforeend", content)
  }

  removeAssociation(event) {
    event.preventDefault()
    const wrapper = event.target.closest("[data-nested-form-target='wrapper']")
    if (wrapper.querySelector("input[name*='_destroy']")) {
      wrapper.querySelector("input[name*='_destroy']").value = 1
      wrapper.style.display = "none"
    } else {
      wrapper.remove()
    }
  }
}
