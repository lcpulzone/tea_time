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
    end
  end

  describe 'cancel' do
    it 'can udpate a tea subscription status to cancelled' do
      tea_2 = create(:tea)
      customer_2 = create(:customer)
      subscription_2 = Subscription.create(title: "Zelda II: Adventure of Link", price: 30.03, status: "active", frequency: "Quinquennal", tea_id: "#{tea_2.id}", customer_id: "#{customer_2.id}")
      updated_subscription_2_status = {status: "cancelled"}

      patch api_v1_subscription_path("#{subscription_2.id}", params: updated_subscription_2_status)
      updated_subscription = JSON.parse(response.body, symbolize_names: true)

      expect(subscription_2.status).to eq("active")
      expect(updated_subscription[:data][:attributes][:status]).to eq("cancelled")
    end
  end

  describe 'all' do
    it 'can get all of a customers active and cancelled subscriptions' do
      tea_3 = create(:tea)
      customer_3 = create(:customer)
      subscriptions_3 = create_list(:subscription, 5, tea: tea_3, customer: customer_3)

      get api_v1_customer_subscriptions_path("#{customer_3.id}")
      subscription_response = JSON.parse(response.body, symbolize_names: true)

      expect(subscription_response[:data].class).to eq(Array)
      expect(subscription_response[:data].count).to eq(5)
    end
  end
end
