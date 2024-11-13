require 'rails_helper'

RSpec.describe Subscription, type: :request do
  describe 'Get/index' do 
    it 'return all subscriptions' do 
      customer = Customer.create!(first_name: "Melchor", last_name: "De La Rosa", email: "m@dev.com", address: "123 main st")
      tea = Tea.create!(title: "Grean tea", description: "Healthy", temperature: 70, brew_time: 2)
      tea_2 = Tea.create!(title: "Black tea", description: "Healthy", temperature: 70, brew_time: 2)
      subscription = Subscription.create!(title: "Tea Sub", price: 20.99, status: "active", frequency: "yearly", customer_id: customer.id)
      subscription_2 = Subscription.create!(title: "Tea Sub", price: 20.99, status: "cancelled", frequency: "yearly", customer_id: customer.id)
      SubscriptionTea.create(tea_id: tea.id, subscription_id: subscription.id)
      SubscriptionTea.create(tea_id: tea_2.id, subscription_id: subscription_2.id)
      
      get "/api/v1/subscriptions"
      
      expect(response).to be_successful
      
      customer_subs = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(customer_subs.size).to eq(2)

      first_subscription = customer_subs[0]
      expect(first_subscription[:type]).to eq("subscription")
      expect(first_subscription[:attributes][:title]).to eq("Tea Sub")
      expect(first_subscription[:attributes][:price]).to eq("20.99")
      expect(first_subscription[:attributes][:status]).to eq("active")
      expect(first_subscription[:attributes][:frequency]).to eq("yearly")
      
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
      expect(second_subscription[:attributes][:status]).to eq("cancelled")
      expect(second_subscription[:attributes][:frequency]).to eq("yearly")
      
      second_subscription_teas = second_subscription[:attributes][:teas]
      expect(second_subscription_teas.size).to eq(1)
      expect(second_subscription_teas[0][:title]).to eq("Black tea")
      expect(second_subscription_teas[0][:description]).to eq("Healthy")
      expect(second_subscription_teas[0][:temperature]).to eq(70)
      expect(second_subscription_teas[0][:brew_time]).to eq(2)
    end
  end

  describe 'Get/show' do 
    it 'return a subscription with a customer and the teas' do 
      customer = Customer.create!(first_name: "Melchor", last_name: "De La Rosa", email: "m@dev.com", address: "123 main st")
      tea = Tea.create!(title: "Grean tea", description: "Healthy", temperature: 70, brew_time: 2)
      subscription = Subscription.create!(title: "Tea Sub", price: 20.99, status: "active", frequency: "yearly", customer_id: customer.id)
      SubscriptionTea.create(tea_id: tea.id, subscription_id: subscription.id)

      get "/api/v1/subscriptions/#{subscription.id}"

      expect(response).to be_successful

      subscription = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

      expect(subscription[:title]).to be_a(String)
      expect(subscription[:price]).to be_a(String)
      expect(subscription[:status]).to be_a(String)
      expect(subscription[:frequency]).to be_a(String)
      expect(subscription[:customer_id]).to be_an(Integer)
      expect(subscription[:customers][:id]).to be_an(Integer)
      expect(subscription[:customers][:first_name]).to be_a(String)
      expect(subscription[:customers][:last_name]).to be_a(String)
      expect(subscription[:customers][:email]).to be_a(String)
      expect(subscription[:customers][:address]).to be_a(String)
      teas = subscription[:teas]
      teas.each do |tea|
        expect(tea[:id]).to be_an(Integer)
        expect(tea[:title]).to be_a(String)
        expect(tea[:description]).to be_a(String)
        expect(tea[:temperature]).to be_an(Integer)
        expect(tea[:brew_time]).to be_an(Integer)
      end
    end

    describe 'Patch' do
      it 'changing status form active to cancelled' do
        customer = Customer.create!(first_name: "Melchor", last_name: "De La Rosa", email: "m@dev.com", address: "123 main st")
        tea = Tea.create!(title: "Grean tea", description: "Healthy", temperature: 70, brew_time: 2)
        subscription = Subscription.create!(title: "Tea Sub", price: 20.99, status: "active", frequency: "yearly", customer_id: customer.id)
        SubscriptionTea.create(tea_id: tea.id, subscription_id: subscription.id)

        params = {
          status: "cancelled"
        } 

        patch "/api/v1/subscriptions/#{subscription.id}", params: params

        expect(response).to be_successful

        updated_sub = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
        
        expect(updated_sub[:title]).to be_a(String)
        expect(updated_sub[:price]).to be_a(String)
        expect(updated_sub[:status]).to be_a(String)
        expect(updated_sub[:frequency]).to be_a(String)
        expect(updated_sub[:customer_id]).to be_an(Integer)
        expect(updated_sub[:customers][:id]).to be_an(Integer)
        expect(updated_sub[:customers][:first_name]).to be_a(String)
        expect(updated_sub[:customers][:last_name]).to be_a(String)
        expect(updated_sub[:customers][:email]).to be_a(String)
        expect(updated_sub[:customers][:address]).to be_a(String)
        teas = updated_sub[:teas]
        teas.each do |tea|
          expect(tea[:id]).to be_an(Integer)
          expect(tea[:title]).to be_a(String)
          expect(tea[:description]).to be_a(String)
          expect(tea[:temperature]).to be_an(Integer)
          expect(tea[:brew_time]).to be_an(Integer)
        end
      end

      it 'returns an error if subscription doesnt exist' do 
        customer = Customer.create!(first_name: "Melchor", last_name: "De La Rosa", email: "m@dev.com", address: "123 main st")
        tea = Tea.create!(title: "Grean tea", description: "Healthy", temperature: 70, brew_time: 2)
        tea_2 = Tea.create!(title: "Black tea", description: "Healthy", temperature: 70, brew_time: 2)
        subscription = Subscription.create!(title: "Tea Sub", price: 20.99, status: "active", frequency: "yearly", customer_id: customer.id)
        subscription_2 = Subscription.create!(title: "Tea Sub", price: 20.99, status: "cancelled", frequency: "yearly", customer_id: customer.id)
        SubscriptionTea.create(tea_id: tea.id, subscription_id: subscription.id)
        SubscriptionTea.create(tea_id: tea_2.id, subscription_id: subscription_2.id)

        get "/api/v1/subscriptions/243234"

        expect(response).to have_http_status(404)

        error = JSON.parse(response.body, symbolize_names: true)[:errors]
        
        expect(error[0][:status]).to eq('404')
        expect(error[0][:message]).to eq("Subscription not found")
      end

      it 'returns an error if params of status is blank' do 
        customer = Customer.create!(first_name: "Melchor", last_name: "De La Rosa", email: "m@dev.com", address: "123 main st")
        tea = Tea.create!(title: "Grean tea", description: "Healthy", temperature: 70, brew_time: 2)
        tea_2 = Tea.create!(title: "Black tea", description: "Healthy", temperature: 70, brew_time: 2)
        subscription = Subscription.create!(title: "Tea Sub", price: 20.99, status: "active", frequency: "yearly", customer_id: customer.id)
        subscription_2 = Subscription.create!(title: "Tea Sub", price: 20.99, status: "cancelled", frequency: "yearly", customer_id: customer.id)
        SubscriptionTea.create(tea_id: tea.id, subscription_id: subscription.id)
        SubscriptionTea.create(tea_id: tea_2.id, subscription_id: subscription_2.id)
        params = {
          status: ""
        }
        patch "/api/v1/subscriptions/#{subscription.id}", params: params

        expect(response).to have_http_status(422)

        error = JSON.parse(response.body, symbolize_names: true)[:errors]
        
        expect(error[0][:status]).to eq('422')
        expect(error[0][:message]).to eq("Invalid record: Validation failed: Status can't be blank, Status is not included in the list")
      end
    end
  end
end