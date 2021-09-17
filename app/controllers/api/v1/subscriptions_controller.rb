class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions.find_all
    render json: SubscriptionsSerializer.new(subscriptions), status: 202
  end

  def create
    begin
      tea = Tea.find(params[:tea_id])
      customer = Customer.find(params[:customer_id])

      subscription = Subscription.create(subscription_params)
      render json: SubscriptionsSerializer.new(subscription), status: 201

    rescue ActiveRecord::RecordNotFound
      render json: {error: "Please input a tea or customer"}, status: 400
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update(subscription_params)
    render json: SubscriptionsSerializer.new(subscription), status: 200
  end

  private
  def subscription_params
    params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
end
