FactoryBot.define do
   factory :user do
        email { nilpatel0606@gmail.com }
   end

   factory :product do
        association :user
        product_name { 'test product 1' }
        price { 1200 }
        description { 'This is test product.' }
   end
end
