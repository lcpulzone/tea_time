FactoryBot.define do
  factory :tea do
    title { "MyString" }
    description { "MyString" }
    temperature_in_degrrees { 1 }
    brew_time_in_minutes { 1.5 }
  end
end
