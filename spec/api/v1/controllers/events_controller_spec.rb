require 'rails_helper'

RSpec.describe API::V1::EventsController, type: :controller do
  let(:user) { create(:user) }
  let(:my_app) { user.applications.create!(name: RandomData.random_name, url: request.env['HTTP_ORIGIN']) }
  let(:my_event) { my_app.events.create!(name: RandomData.random_name) }
  
  describe "POST create" do
    before { post :create, event: {name: my_event.name} }
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    
    it "returns json content type" do
      expect(response.content_type).to eq("application/json")
    end
    
    it "creates an event with the correct attributes" do
      hashed_json = JSON.parse(response.body)
      expect(hashed_json["name"]).to eq(my_event.name)
    end
  end
end