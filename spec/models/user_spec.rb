require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  it { is_expected.to have_many(:applications) }

  describe "attributes" do
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to password" do
      expect(user).to respond_to(:password)
    end
  end
end
