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

  def update
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.find(params[:id])
    if subscription.update!(sub_params)
      render json: SubscriptionSerializer.new(subscription)
    else
      render json: { error: 'Unable to switch Status' }, status: :unprocessable_entity
    end
  end

  private

  def sub_params
    params.permit(:status)
  end
end