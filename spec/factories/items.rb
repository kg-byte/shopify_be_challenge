FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.department(max: 5) }
    quantity { Faker::Number.within(range: 1..1000) }
    status { 0 }
  end
end
