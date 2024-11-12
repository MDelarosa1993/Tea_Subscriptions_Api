require 'rails_helper'

RSpec.describe Customer, type: :request do
  describe 'Get/index' do 
    it 'return all subscriptions for one customer' do 
      customer = Customer.create!(first_name: "Melchor", last_name: "De La Rosa", email: "m@dev.com", address: "123 main st")
      tea = Tea.create!(title: "Grean tea", description: "Healthy", temperature: 70, brew_time: 2)
      tea_2 = Tea.create!(title: "Black tea", description: "Healthy", temperature: 70, brew_time: 2)
      subscription = Subscription.create!(title: "Tea Sub", price: 20.99, status: "active", frequency: "Yearly", customer_id: customer.id)
      subscription_2 = Subscription.create!(title: "Tea Sub", price: 20.99, status: "canceled", frequency: "Yearly", customer_id: customer.id)
      SubscriptionTea.create(tea_id: tea.id, subscription_id: subscription.id)
      SubscriptionTea.create(tea_id: tea_2.id, subscription_id: subscription_2.id)
      
      get "/api/v1/customers/#{customer.id}/subscriptions"
      
      expect(response).to be_successful
      
      customer_subs = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(customer_subs.size).to eq(2)

      first_subscription = customer_subs[0]
      expect(first_subscription[:type]).to eq("subscription")
      expect(first_subscription[:attributes][:title]).to eq("Tea Sub")
      expect(first_subscription[:attributes][:price]).to eq("20.99")
      expect(first_subscription[:attributes][:status]).to eq("active")
      expect(first_subscription[:attributes][:frequency]).to eq("Yearly")
      
      first_subscription_teas = first_subscription[:attributes][:teas]
      expect(first_subscription_teas.size).to eq(1)
      expect(first_subscription_teas[0][:title]).to eq("Grean tea")
      expect(first_subscription_teas[0][:description]).to eq("Healthy")
      expect(first_subscription_teas[0][:temperature]).to eq(70)
      expect(first_subscription_teas[0][:brew_time]).to eq(2)

      second_subscription = customer_subs[1]
      expect(second_subscription[:type]).to eq("subscription")
      expect(second_subscription[:attributes][:title]).to eq("Tea Sub")
      expect(second_subscription[:attributes][:price]).to eq("20.99")
      expect(second_subscription[:attributes][:status]).to eq("canceled")
      expect(second_subscription[:attributes][:frequency]).to eq("Yearly")
      
      second_subscription_teas = second_subscription[:attributes][:teas]
      expect(second_subscription_teas.size).to eq(1)
      expect(second_subscription_teas[0][:title]).to eq("Black tea")
      expect(second_subscription_teas[0][:description]).to eq("Healthy")
      expect(second_subscription_teas[0][:temperature]).to eq(70)
      expect(second_subscription_teas[0][:brew_time]).to eq(2)
    end
  end
end