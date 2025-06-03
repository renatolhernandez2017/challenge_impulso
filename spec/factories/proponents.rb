FactoryBot.define do
  factory :proponent do
    name { "João da Silva" }
    salary { rand(500..10_000) }
    document { "12345678900" }
    birth_date { "1989-06-02" }
    inss_discount { 200.0 }
    created_at { Time.current }

    after(:build) do |proponent|
      proponent.addresses << build(:address, proponent: proponent)
      proponent.contacts << build(:contact, proponent: proponent)
    end
  end
end
