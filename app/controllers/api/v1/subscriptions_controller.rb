class Api::V1::SubscriptionsController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    tea = Tea.find(params[:tea_id])
    customer = Customer.find(params[:customer_id])
    subscription = Subscription.create(subscription_params)
    render json: SubscriptionsSerializer.new(subscription)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def subscription_params
    params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
end
