class ProponentsController < ApplicationController
  include Pagy::Backend

  def index
   @pagy, @proponents = pagy(Proponent.all.order(created_at: :desc))
  end
end
