require 'rails_helper'

RSpec.describe 'Teas', type: :request do
  it 'can create a tea' do
    tea_1 = {
      title: "Shui Xian",
      description: "Green",
      temperature_in_fahrenheit: 186,
      brew_time_in_minutes: 2.0
    }

    post api_v1_teas_path(tea_1)
    tea_response = JSON.parse(response.body, symbolize_names: true)

    expect(tea_response.class).to eq(Hash)
    expect(tea_response[:data].class).to eq(Hash)
  end
end
