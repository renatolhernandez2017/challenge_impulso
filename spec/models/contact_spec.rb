require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "associations" do
    it { should belong_to(:proponent) }
  end

  describe "validations" do
    it { should validate_presence_of(:contact_type) }
    it { should validate_presence_of(:value) }
  end

  describe "enums" do
    it do
      should define_enum_for(:contact_type).with_values(
        residential_phone: 0,
        mobile: 1,
        whatsapp: 2,
        email: 3
      )
    end
  end
end
