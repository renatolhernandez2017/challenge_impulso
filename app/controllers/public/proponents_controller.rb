class Public::ProponentsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @proponent = Proponent.new
    @proponent.addresses.build
    @proponent.contacts.build
  end
  
  def create
    @proponent = Proponent.new(proponent_params)

    if @proponent.save
      redirect_to new_public_proponent_path, notice: "Cadastro realizado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def proponent_params
    params.require(:proponent).permit(
      :name, :document, :birth_date, :salary, :inss_discount,
      addresses_attributes: %i[street number neighborhood city state zip_code _destroy],
      contacts_attributes: %i[contact_type value _destroy]
    )
  end
end
