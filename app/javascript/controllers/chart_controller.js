// app/javascript/controllers/chart_controller.js
import { Controller } from "@hotwired/stimulus"
import Chart from "chart.js/auto"

export default class extends Controller {
  static values = {
    labels: Array,
    data: Array,
    title: String,
    type: { type: String, default: "bar" } // suporta "bar", "pie", "line", etc.
  }

  connect() {
    const ctx = this.element.getContext("2d")

    new Chart(ctx, {
      type: this.typeValue,
      data: {
        labels: this.labelsValue,
        datasets: [{
          label: this.titleValue,
          data: this.dataValue,
          backgroundColor: this.typeValue === "pie"
            ? this.generateColors(this.dataValue.length)
            : "#0d6efd"
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: { display: true }
        }
      }
    })
  }

  generateColors(count) {
    const colors = [
      "#0d6efd", "#6610f2", "#6f42c1", "#d63384",
      "#dc3545", "#fd7e14", "#ffc107", "#198754",
      "#20c997", "#0dcaf0"
    ]
    return colors.slice(0, count)
  }
}
