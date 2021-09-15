FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature_in_fahrenheit { Faker::Number.within(range: 120..200) }
    brew_time_in_minutes { Faker::Number.within(range: 2..7) }
  end
end
