FactoryBot.define do
  factory :item do
    name                          { Faker::Commerce.product_name }
    description                   { Faker::Lorem.sentence }
    price                         { Faker::Number.number(digits: 4) }
    category_id                   { '2' }
    condition_id                  { '2' }
    postage_id                    { '2' }
    region_id                     { '2' }
    until_shipping_id             { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

    
