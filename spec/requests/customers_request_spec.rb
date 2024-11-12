require 'rails_helper'

RSpec.describe Customer, type: :request do
  describe 'Get/index' do 
    it 'return all subscriptions for one customer' do 
      customer = Customer.create!(first_name: "Melchor", last_name: "De La Rosa", email: "m@dev.com", address: "123 main st")
      tea = Tea.create!(title: "Grean tea", description: "Healthy", temperature: 70, brew_time: 2)
      subscription = Subscription.create!(title: "Tea Sub", price: 20.99, status: "active", frequency: "Yearly", customer_id: customer.id)
      SubscriptionTea.create(tea_id: tea.id, subscription_id: subscription.id)
    
      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response).to be_successful

      customer_subs = JSON.parse(response.body, symbolizes_names: true)
      require 'pry'; binding.pry
    end
  end
end