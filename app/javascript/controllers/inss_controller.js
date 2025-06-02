import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "result", "resultHidden"]

  async updateDiscount() {
    const salary = this.inputTarget.value

    if (!salary) {
      this.resultTarget.textContent = ""
      this.resultTarget.value = ""

      this.resultHiddenTarget.textContent = ""
      this.resultHiddenTarget.value = ""
      return
    }

    try {
      const response = await fetch(`/api/inss/discount?salary=${salary}`, {
        headers: {
          "Accept": "application/json"
        }
      })

      const data = await response.json()
      this.resultTarget.value = data.discount
      this.resultTarget.textContent = `Desconto: R$ ${data.discount}`

      this.resultHiddenTarget.value = data.discount
      this.resultHiddenTarget.textContent = `Desconto: R$ ${data.discount}`
    } catch (error) {
      console.error("Erro ao calcular desconto INSS", error)
      this.resultTarget.textContent = "Erro ao calcular desconto"
      this.resultHiddenTarget.textContent = "Erro ao calcular desconto"
    }
  }
}
