require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  it 'can create a customer' do
    customer_1 = {
      first_name: "Danilo",
      last_name: "Stark",
      email: "vincenza@example.net",
      address: "70069 Emmerich Glens, Port Kinamouth, IN 92013-6820"
    }

    post api_v1_customers_path(customer_1)
    customer_response = JSON.parse(response.body, symbolize_names: true)

    expect(customer_response.class).to eq(Hash)
    expect(customer_response[:data].class).to eq(Hash)
  end
end
