FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :product do
    product_name { Faker::Name.name }
    price { Faker::Number.between(from: 5000, to: 10_000) }
    description { Faker::Lorem.characters(number: 50, min_alpha: 50) }
  end
end
