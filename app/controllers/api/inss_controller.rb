class Api::InssController < ApplicationController
  skip_before_action :authenticate_user!

  def discount
    salary = params[:salary].to_f
    discount = InssDiscountCalculator.call(salary)
    @proponent = Proponent.new
    @proponent.addresses.build
    @proponent.contacts.build

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "form_proponent",
          partial: "public/proponents/form",
          locals: { proponent: @proponent, discount: discount.round(2), btn_save: "Salvar" }
        )
      end

      format.json { render json: { proponent: @proponent, discount: discount.round(2), btn_save: "Salvar" } }
    end
  end
end
