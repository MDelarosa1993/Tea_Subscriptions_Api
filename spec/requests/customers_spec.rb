require 'rails_helper'

RSpec.describe Customer, type: :request do
  describe "GET /index" do
    it "returns http success" do
      Customer.create!(first_name: "Melchor", last_name: "De La Rosa", email: "m@dev.com", address: "123 main st")
      Customer.create!(first_name: "Sabrina", last_name: "De La Rosa", email: "s@dev.com", address: "123 main st")
      Customer.create!(first_name: "Alonnah", last_name: "De La Rosa", email: "a@dev.com", address: "123 main st")

      get "/api/v1/customers"

      expect(response).to be_successful

      customers = JSON.parse(response.body, symbolize_names: true)[:data]
      
      customers.each do |customer|
        expect(customer[:id]).to be_a(String)
        expect(customer[:type]).to be_a(String)
        expect(customer[:attributes]).to be_a(Hash)
        expect(customer[:attributes][:first_name]).to be_a(String)
        expect(customer[:attributes][:last_name]).to be_a(String)
        expect(customer[:attributes][:email]).to be_an(String)
        expect(customer[:attributes][:address]).to be_an(String)
      end
    end
  end
end
