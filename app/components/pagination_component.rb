# frozen_string_literal: true

class PaginationComponent < ViewComponent::Base
  def initialize(pagy:)
    @pagy = pagy
  end
end
