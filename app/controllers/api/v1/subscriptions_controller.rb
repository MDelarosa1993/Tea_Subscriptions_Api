class Api::V1::SubscriptionsController < ApplicationController
  def index
    begin
      subscriptions = Subscription.includes(:customer, :teas).all
      render json: SubscriptionSerializer.new(subscriptions)
    rescue ActiveRecord::RecordNotFound => e
      render json: ErrorSerializer.error_message(404, "Record not found: #{e.message}"), status: :not_found
    end
  end

  def show
    begin
      subscription = Subscription.includes(:customer, :teas).find(params[:id])
      render json: SubscriptionSerializer.new(subscription)
    rescue ActiveRecord::RecordNotFound
      render json: ErrorSerializer.error_message(404, "Subscription not found"), status: :not_found
    end
  end


  def update
    begin
      subscription = Subscription.includes(:teas).find(params[:id])
      subscription.update!(sub_params)
      render json: SubscriptionSerializer.new(subscription) 
    rescue ActiveRecord::RecordInvalid => e
      render json: ErrorSerializer.error_message(422, "Invalid record: #{e.message}"), status: :unprocessable_entity
    end
  end

  private

  def sub_params
    params.permit(:status)
  end
end