// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";

Turbo.StreamActions.redirect = function () {
  Turbo.visit(this.target);
};

document.addEventListener("turbo:load", () => {
  document.querySelectorAll("select[name*='[contact_type]']").forEach((select) => {
    const wrapper = select.closest("[data-controller='contact-type']")

    const emailField = wrapper.querySelector("[data-email-field]")
    const numberField = wrapper.querySelector("[data-number-field]")

    if (!emailField || !numberField) return

    function toggleFields() {
      if (select.value === "email") {
        emailField.classList.remove("d-none")
        numberField.classList.add("d-none")
      } else {
        emailField.classList.add("d-none")
        numberField.classList.remove("d-none")
      }
    }

    // Inicializa ao carregar
    toggleFields()

    // Escuta mudanças
    select.addEventListener("change", toggleFields)
  })
})
