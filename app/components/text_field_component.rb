# frozen_string_literal: true

class TextFieldComponent < ViewComponent::Base
  def initialize(form:, field_name:, type: nil, label: nil, data: nil, readonly: nil, error_message: nil)
    @form = form
    @field_name = field_name
    @type = type
    @data = data
    @readonly = readonly

    @error_message = error_message
    @label = label
  end
end
