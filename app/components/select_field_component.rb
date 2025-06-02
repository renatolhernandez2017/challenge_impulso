# frozen_string_literal: true

class SelectFieldComponent < ViewComponent::Base
  def initialize(form:, field_name:, options: {}, label: nil, data: nil, selected: nil, disabled: nil, error_message: nil)
    @form = form
    @field_name = field_name
    @options = options
    @label = label || @form.object.class.human_attribute_name(@field_name)
    @data = data
    @error_message = error_message
    @selected = selected.present? ? selected : @form.object.send(@field_name)
    @disabled = disabled
  end
end
