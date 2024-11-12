require 'rails_helper'

RSpec.describe Subscription, type: :request do
  describe 'Get/show' do 
    it 'return a subscription with a customer and the teas' do 
      customer = Customer.create!(first_name: "Melchor", last_name: "De La Rosa", email: "m@dev.com", address: "123 main st")
      tea = Tea.create!(title: "Grean tea", description: "Healthy", temperature: 70, brew_time: 2)
      subscription = Subscription.create!(title: "Tea Sub", price: 20.99, status: "active", frequency: "yearly", customer_id: customer.id)
      SubscriptionTea.create(tea_id: tea.id, subscription_id: subscription.id)

      get "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}"

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
      expect(subscription[:customers][:status]).to be_a(String)
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

        patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", params: params

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
        expect(updated_sub[:customers][:status]).to be_a(String)
        teas = updated_sub[:teas]
        teas.each do |tea|
          expect(tea[:id]).to be_an(Integer)
          expect(tea[:title]).to be_a(String)
          expect(tea[:description]).to be_a(String)
          expect(tea[:temperature]).to be_an(Integer)
          expect(tea[:brew_time]).to be_an(Integer)
        end
      end
    end
  end
end