FactoryBot.define do
  factory :user do
    name { "Teste" }
    email { Faker::Internet.unique.email }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
