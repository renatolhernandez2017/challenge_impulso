// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";

Turbo.StreamActions.redirect = function () {
  Turbo.visit(this.target);
};

// document.addEventListener("turbo:load", initContactTypeFields)
// document.addEventListener("turbo:frame-load", initContactTypeFields)

// function initContactTypeFields() {
//   document.querySelectorAll("[data-controller='contact-type']").forEach((wrapper) => {
//     const select = wrapper.querySelector("select[name*='[contact_type]']")
//     const emailField = wrapper.querySelector("[data-email-field]")
//     const numberField = wrapper.querySelector("[data-number-field]")

//     if (!select || !emailField || !numberField) return

//     function toggleFields() {
//       const value = select.value || wrapper.dataset.contactTypeInitialValue

//       if (value === "email") {
//         emailField.classList.remove("d-none")
//         numberField.classList.add("d-none")
//       } else {
//         emailField.classList.add("d-none")
//         numberField.classList.remove("d-none")
//       }
//     }

//     toggleFields()
//     select.addEventListener("change", toggleFields)
//   })
// }
