require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { create(:user) }
  let(:application) {user.applications.create!(name: RandomData.random_name, url: RandomData.random_url)}
  let(:event) {application.events.create!(name: RandomData.random_name)}
  
  it { is_expected.to belong_to(:application) }
  
  describe "attributes" do
    it "has a name attribute" do
      expect(event).to have_attributes(name: event.name)
    end
  end
end