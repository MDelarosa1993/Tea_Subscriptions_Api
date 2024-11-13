require 'rails_helper'

RSpec.describe Tea, type: :request do
  describe "GET /index" do
    it "returns all teas" do
      Tea.create!(title: "Grean tea", description: "Healthy", temperature: 70, brew_time: 2)
      Tea.create!(title: "Black tea", description: "Healthy", temperature: 50, brew_time: 5)
      Tea.create!(title: "Red tea", description: "Healthy", temperature: 60, brew_time: 7)
      get "/api/v1/teas"

      expect(response).to be_successful

      teas = JSON.parse(response.body, symbolize_names: true)[:data]

      teas.each do |tea|
        expect(tea[:id]).to be_a(String)
        expect(tea[:type]).to be_a(String)
        expect(tea[:attributes]).to be_a(Hash)
        expect(tea[:attributes][:title]).to be_a(String)
        expect(tea[:attributes][:description]).to be_a(String)
        expect(tea[:attributes][:temperature]).to be_an(Integer)
        expect(tea[:attributes][:brew_time]).to be_an(Integer)
      end
    end
  end
end
