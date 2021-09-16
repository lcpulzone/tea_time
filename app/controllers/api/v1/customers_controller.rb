class Api::V1::CustomersController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    customer = Customer.create(customer_params)
    render json: CustomersSerializer.new(customer)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end
end
