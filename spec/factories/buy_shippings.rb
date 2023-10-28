FactoryBot.define do
  factory :buy_shipping do
    post_code                         { '123-4567' }
    region_id                         { '2' }
    municipality                      { '新宿区'}
    street_address                    { '1-1-1' }
    building_name                     { '新宿ビル'}
    phone                             { '08011111111' }
  
  end
end
