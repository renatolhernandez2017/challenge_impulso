class InssController < ApplicationController
  def discount
    salary = params[:salary].to_f
    discount = InssCalculator.calculate(salary)
    render json: { discount: discount }
  end
end
