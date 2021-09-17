class Api::V1::CustomersController < ApplicationController
  def create
    customer = Customer.create(customer_params)
    render json: CustomersSerializer.new(customer), status: 201
  end

  private
  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end
end
