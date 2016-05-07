require 'rails_helper'

RSpec.describe Application, type: :model do
  let(:user) { create(:user) }
  let(:application) {user.applications.create!(name: RandomData.random_name, url: RandomData.random_url)}

  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "should respond to name" do
      expect(application).to respond_to(:name)
    end

    it "should respond to password" do
      expect(application).to respond_to(:url)
    end
  end
end
