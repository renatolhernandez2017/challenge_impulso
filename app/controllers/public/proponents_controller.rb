class Public::ProponentsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_contact_types

  def index
    @proponent = Proponent.new
    @proponent.addresses.build
    @proponent.contacts.build
  end
  
  def create
    @proponent = Proponent.new(proponent_params)

    if @proponent.save
      flash[:success] = "Cadastro realizado com sucesso!"
      render turbo_stream: turbo_stream.action(:redirect, public_proponents_path)
    else
      render turbo_stream: turbo_stream.replace("form_proponent",
        partial: "public/proponents/form",
          locals: { proponent: @proponent, contact_types: @contact_types, btn_save: "Salvar" }
        )
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

  def set_contact_types
    @contact_types = Contact.contact_types.keys.map { |type| [t("attributes.contact.contact_type.#{type}"), type] }
  end
end
