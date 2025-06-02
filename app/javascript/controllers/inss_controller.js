import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["salary", "discount"]

  connect() {
    if (this.hasSalaryTarget) {
      this.salaryTarget.addEventListener("change", this.handleChange)
    }
  }

  disconnect() {
    if (this.hasSalaryTarget) {
      this.salaryTarget.removeEventListener("change", this.handleChange)
    }
  }

  handleChange = () => {
    fetch(`/inss/discount?salary=${this.salaryTarget.value}`)
      .then(response => response.json())
      .then(data => {
        if (this.hasDiscountTarget) {
          this.discountTarget.value = data.discount;
        }
      });
  }
}
