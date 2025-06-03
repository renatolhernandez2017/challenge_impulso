puts "apagando dados antigos..."
Address.destroy_all
Contact.destroy_all
Proponent.destroy_all

puts "Criando Proponentes, com contato e endereço"
contact_types = {residential_phone: 0, mobile: 1, whatsapp: 2, email: 3}

10.times do |i|
  proponent = Proponent.create!(
    name: Faker::Name.name,
    document: Faker::IdNumber.brazilian_citizen_number,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    salary: Faker::Commerce.price(range: 100.0..7786.02),
    inss_discount: 0.0
  )

  inss_discount = InssDiscountCalculator.call(proponent.salary)
  proponent.update(inss_discount: inss_discount)

  Address.create!(
    street: Faker::Address.street_name,
    number: Faker::Address.building_number,
    neighborhood: Faker::Address.community,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip_code,
    proponent: proponent
  )

  2.times do |i|
    contact_type = contact_types.keys.sample
    value = if contact_type == :email
      Faker::Internet.email
    else
      Faker::PhoneNumber.cell_phone
    end

    Contact.create!(
      contact_type: contact_type,
      value: value,
      proponent: proponent
    )
  end
end

puts "Fim!"
