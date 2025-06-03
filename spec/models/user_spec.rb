require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Devise modules" do
    it "includes Devise modules" do
      expect(described_class.ancestors).to include(Devise::Models::DatabaseAuthenticatable)
      expect(described_class.ancestors).to include(Devise::Models::Registerable)
      expect(described_class.ancestors).to include(Devise::Models::Recoverable)
      expect(described_class.ancestors).to include(Devise::Models::Rememberable)
      expect(described_class.ancestors).to include(Devise::Models::Validatable)
    end
  end

  describe "validations" do
    subject { build(:user) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value("user@example.com").for(:email) }
    it { should_not allow_value("invalid_email").for(:email) }

    context "when password is required" do
      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password).is_at_least(6).is_at_most(100) }
    end
  end
end
