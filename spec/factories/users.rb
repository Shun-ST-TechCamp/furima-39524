FactoryBot.define do
  factory :user do
    nickname                          { Faker::Internet.username }
    email                             { Faker::Internet.email }
    password                          { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name_kanji                   { '田中' }
    first_name_kanji                  { '一郎' }
    last_name_kana                    { 'タナカ' }
    first_name_kana                   { 'イチロウ' }
    birth_day                         { '2000-01-01' }
  end
end
