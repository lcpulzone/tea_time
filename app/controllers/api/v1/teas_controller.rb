class Api::V1::TeasController < ApplicationController
  def create
    tea = Tea.create(tea_params)
    render json: TeasSerializer.new(tea)
  end

  private
  def tea_params
    params.permit(:title, :description, :temperature_in_fahrenheit, :brew_time_in_minutes)
  end
end
