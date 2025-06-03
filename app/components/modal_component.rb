# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  def initialize(form:, title:, btn_back: nil)
    @form = form
    @title = title
    @btn_back = btn_back || "Voltar"
  end
end
