class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions.find_all
    render json: SubscriptionsSerializer.new(subscriptions)
  end

  def create
    tea = Tea.find(params[:tea_id])
    customer = Customer.find(params[:customer_id])
    subscription = Subscription.create(subscription_params)
    render json: SubscriptionsSerializer.new(subscription)
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update(subscription_params)
    render json: SubscriptionsSerializer.new(subscription)
  end
  
  private
  def subscription_params
    params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
end
