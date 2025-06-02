require 'rails_helper'

RSpec.describe "Public::Proponents", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/public/proponents/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/public/proponents/create"
      expect(response).to have_http_status(:success)
    end
  end

end
