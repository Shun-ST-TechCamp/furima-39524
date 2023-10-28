FactoryBot.define do
  factory :buy_shipping do
    post_code                         { '123-4567' }
    region_id                         { '1' }
    municipa                          { '新宿区'}
    street_address                    { '1-1-1' }
    phone                             { '08011111111' }
  
  end
end
