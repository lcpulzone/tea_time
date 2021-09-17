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

      expect(response.status).to eq(201)
      expect(subscription_response.class).to eq(Hash)
      expect(subscription_response[:data].class).to eq(Hash)
      expect(subscription_response[:data][:attributes].size).to eq(6)
      expect(subscription_response[:data][:attributes][:title].class).to eq(String)
      expect(subscription_response[:data][:attributes][:price].class).to eq(Float)
    end

    it 'does not create a new subscription without a tea or customer' do
      customer1 = create(:customer)

      subscription1 = {
        title: "Breath of the Wild",
        price: 28.32,
        status: "active",
        frequency: "Triennal",
        tea_id: nil,
        customer_id: "#{customer1.id}"
      }

      post api_v1_subscriptions_path(subscription1)
      subscription_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(subscription_response).to eq({error: "Record Not Found"})
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

      expect(response.status).to eq(200)
      expect(subscription_2.status).to eq("active")
      expect(updated_subscription[:data][:attributes][:status]).to eq("cancelled")
    end

    it 'will return an error without a valid subscription id' do
      subscription2id = 1
      updated_subscription2_status = {status: "cancelled"}

      patch api_v1_subscription_path(subscription2id, params: updated_subscription2_status)
      failed_subscription = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(406)
      expect(failed_subscription).to eq({error: "Record Not Found"})
    end
  end

  describe 'all' do
    it 'can get all of a customers active and cancelled subscriptions' do
      tea_3 = create(:tea)
      customer_3 = create(:customer)
      subscriptions_3 = create_list(:subscription, 5, tea: tea_3, customer: customer_3)

      get api_v1_customer_subscriptions_path("#{customer_3.id}")
      subscription_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(202)
      expect(subscription_response[:data].class).to eq(Array)
      expect(subscription_response[:data].count).to eq(5)
    end

    it 'will not return all subscriptions without a valid customer' do
      tea3 = create(:tea)
      customer3 = 1

      get api_v1_customer_subscriptions_path(customer3)
      subscription_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
      expect(subscription_response).to eq({error: "Customer not found"})
    end
  end
end
