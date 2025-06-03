class ProponentsController < ApplicationController
  include Pagy::Backend

  def index
   @pagy, @proponents = pagy(Proponent.all)
  end
end
