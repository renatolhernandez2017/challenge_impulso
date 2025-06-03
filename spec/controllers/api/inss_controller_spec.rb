require 'rails_helper'

RSpec.describe Api::InssController, type: :controller do
  describe "GET #discount" do
    let(:salary) { 3000.0 }
    let(:discount_value) { 270.50 }

    before do
      allow(InssDiscountCalculator).to receive(:call).with(salary).and_return(discount_value)
    end

    context "formato turbo_stream" do
      it "renderiza turbo_stream com o formulário atualizado" do
        get :discount, params: { salary: salary }, format: :turbo_stream

        expect(response).to have_http_status(:ok)
        expect(response.media_type).to eq("text/vnd.turbo-stream.html")
        expect(response.body).to include("turbo-stream")
        expect(response.body).to include("form_proponent")
        expect(response.body).to include("turbo-stream")
      end
    end

    context "formato json" do
      it "retorna JSON com proponent, discount e btn_save" do
        get :discount, params: { salary: salary }, format: :json

        json = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(response.media_type).to eq("application/json")

        expect(json["btn_save"]).to eq("Salvar")
        expect(json["discount"]).to eq(discount_value.round(2))

        expect(json["proponent"]).to be_a(Hash)
        expect(json["proponent"].keys).to include("id", "name", "document", "birth_date", "salary", "inss_discount", "created_at", "updated_at")
      end
    end
  end
end
