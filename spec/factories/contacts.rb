FactoryBot.define do
  factory :contact do
    proponent { nil }
    contact_type { "email" }
    value { "fulano@email.com" }
  end
end
