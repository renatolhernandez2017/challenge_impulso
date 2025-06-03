require 'rails_helper'

RSpec.describe Public::ProponentsController, type: :controller do
  describe "GET #index" do
    it "atribui um novo proponente com endereço e contato" do
      get :index

      proponent = assigns(:proponent)

      expect(proponent).to be_a_new(Proponent)
      expect(proponent.addresses.size).to eq(1)
      expect(proponent.contacts.size).to eq(1)

      expect(assigns(:contact_types)).to be_an(Array)
    end
  end

  describe "POST #create" do
    let(:valid_attributes) do
      {
        name: "Fulano",
        document: "12345678900",
        birth_date: "1990-01-01",
        salary: 5000,
        inss_discount: 500,
        addresses_attributes: [{
          street: "Rua 1", number: "10", neighborhood: "Centro",
          city: "Cidade", state: "SP", zip_code: "12345-000"
        }],
        contacts_attributes: [{
          contact_type: "email", value: "fulano@email.com"
        }]
      }
    end

    let(:invalid_attributes) do
      valid_attributes.merge(name: "")
    end

    context "com parâmetros válidos" do
      it "cria o proponente e redireciona via Turbo Stream" do
        post :create, params: { proponent: valid_attributes }, format: :turbo_stream

        expect(Proponent.count).to eq(1)
        expect(response.media_type).to eq("text/vnd.turbo-stream.html")
        expect(response.body).to include("turbo-stream action=\"redirect\"")
        expect(flash[:success]).to eq("Cadastro realizado com sucesso!")
      end
    end

    context "com parâmetros inválidos" do
      it "não cria e re-renderiza o formulário via Turbo Stream" do
        post :create, params: { proponent: invalid_attributes }, format: :turbo_stream

        expect(Proponent.count).to eq(0)
        expect(response.media_type).to eq("text/vnd.turbo-stream.html")
        expect(response.body).to include("turbo-stream action=\"replace\"")
        expect(response.body).to include("form")
      end
    end
  end
end
