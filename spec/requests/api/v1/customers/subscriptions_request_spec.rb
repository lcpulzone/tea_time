require 'rails_helper'

RSpec.describe 'Subscriptions', type: :request do
  it 'exhibits a customer subscription life cycle' do
    customer_1 = create(:customer)
    tea_1 = create(:tea)
    subscription_1 = create(:subscription, customer: customer_1, tea: tea_1)

    post api_v1_new_customer_path(customer_1)
    customer_response = JSON.parse(response.body, symbolize_names: true)
    post api_v1_new_tea_path(tea_1)
    tea_response = JSON.parse(response.body, symbolize_names: true)
    post api_v1_new_subscription_path(subscription_1)
    subscription_response = JSON.parse(response.body, symbolize_names: true)


  end
end
