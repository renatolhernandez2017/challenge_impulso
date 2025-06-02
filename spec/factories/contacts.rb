FactoryBot.define do
  factory :contact do
    proponent { nil }
    contact_type { 1 }
    value { "MyString" }
  end
end
