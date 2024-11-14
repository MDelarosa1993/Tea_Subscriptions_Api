class Api::V1::CustomersController < ApplicationController
  def index
    customers = Customer.all 
    render json: CustomerSerializer.new(customers)
  end

  def show
    begin
      customer = Customer.find(params[:id])
      render json: CustomerSerializer.new(customer)
    rescue ActiveRecord::RecordNotFound
      render json: ErrorSerializer.error_message(404, "Customer not Found"), status: :not_found
    end
  end
end
