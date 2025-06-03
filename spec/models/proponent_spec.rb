require 'rails_helper'

RSpec.describe Proponent, type: :model do
  describe "associations" do
    it { should have_many(:addresses).dependent(:destroy) }
    it { should have_many(:contacts).dependent(:destroy) }
  end

  describe "nested attributes" do
    it { should accept_nested_attributes_for(:addresses).allow_destroy(true) }
    it { should accept_nested_attributes_for(:contacts).allow_destroy(true) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:document) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:salary) }
    it { should validate_presence_of(:inss_discount) }
  end
end
