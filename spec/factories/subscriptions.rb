FactoryBot.define do
  factory :subscription do
    title { Faker::Games::Zelda.game }
    price { Faker::Commerce.price }
    status { 0 }
    frequency { Faker::Subscription.subscription_term }
    tea { nil }
    customer { nil }
  end
end
