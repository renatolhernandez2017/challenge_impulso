class InssController < ApplicationController
  def discount
    salary = params[:salary].to_f
    discount = InssDiscountCalculator.call(salary)
    render json: { discount: discount }
  end
end
