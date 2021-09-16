require 'rails_helper'

RSpec.describe 'Subscriptions', type: :request do
  it 'exhibits a customer subscription life cycle' do
    customer_1 = {
        first_name: "Danilo",
        last_name: "Stark",
        email: "vincenza@example.net",
        address: "70069 Emmerich Glens, Port Kinamouth, IN 92013-6820"
      }
    tea_1 = {
        title: "Shui Xian",
        description: "Green",
        temperature_in_fahrenheit: 186,
        brew_time_in_minutes: 2.0
      }
      subscription_1 = {
        title: "Breath of the Wild",
        price: 28.32,
        status: "active",
        frequency: "Triennal"
      }

    post api_v1_customers_path(customer_1)
    customer_response = JSON.parse(response.body, symbolize_names: true)

    post api_v1_teas_path(tea_1)
    tea_response = JSON.parse(response.body, symbolize_names: true)

    post api_v1_subscriptions_path(subscription_1)
    subscription_response = JSON.parse(response.body, symbolize_names: true)


  end
end
