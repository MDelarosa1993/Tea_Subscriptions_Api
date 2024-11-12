class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions)
  end

  def show
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.find(params[:id])
    render json: SubscriptionSerializer.new(subscription)
  end
end