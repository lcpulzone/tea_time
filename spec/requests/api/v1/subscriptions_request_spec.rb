require 'rails_helper'

RSpec.describe 'Subscriptions', type: :request do
  describe 'create' do
    it 'can generate a new customer, tea and subscription' do
      tea_1 = {
        title: "Shui Xian",
        description: "Green",
        temperature_in_fahrenheit: 186,
        brew_time_in_minutes: 2.0
      }
      customer_1 = {
        first_name: "Danilo",
        last_name: "Stark",
        email: "vincenza@example.net",
        address: "70069 Emmerich Glens, Port Kinamouth, IN 92013-6820"
      }

      post api_v1_teas_path(tea_1)
      tea_response = JSON.parse(response.body, symbolize_names: true)

      post api_v1_customers_path(customer_1)
      customer_response = JSON.parse(response.body, symbolize_names: true)

      subscription_1 = {
        title: "Breath of the Wild",
        price: 28.32,
        status: "active",
        frequency: "Triennal",
        tea_id: "#{tea_response[:data][:id]}",
        customer_id: "#{customer_response[:data][:id]}"
      }

      post api_v1_subscriptions_path(subscription_1)
      subscription_response = JSON.parse(response.body, symbolize_names: true)

      expect(subscription_response.class).to eq(Hash)
      expect(subscription_response[:data].class).to eq(Hash)
      expect(subscription_response[:data][:attributes].size).to eq(6)
      expect(subscription_response[:data][:attributes][:title].class).to eq(String)
      expect(subscription_response[:data][:attributes][:price].class).to eq(Float)
# {
#   :data=>
#   {
#     :id=>"42",
#     :type=>"subscriptions",
#     :attributes=>
#     {
#       :title=>"Breath of the Wild",
#       :price=>28.32,
#       :status=>"active",
#       :frequency=>"Triennal",
#       :tea_id=>51,
#       :customer_id=>55
#     }
#   }
# }
    end
  end

  describe 'cancel' do
    it 'can cancel a tea subscription without deleting it' do
      tea_2 = create(:tea)
      customer_2 = create(:customer)
      subscription_2 = create(:subscription, tea: tea_2, customer: customer_2)

      patch api_v1_subscription_path(status: 1)
      updated_subscription = JSON.parse(response.body, symbolize_names: true)
      require "pry";binding.pry
    end
  end
end
