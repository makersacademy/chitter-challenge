require './app/models/user'
require 'spec_helper'

  describe User do
    subject(:user) {described_class.create(name: "Isabel", username: "Isabel", email: "isabel@example.com", password: "test", password_confirmation: "test")}

    describe "When signing in" do
      it "should be return true when user is authenticated" do
        expect(user.authenticated?("test")).to eq true
      end
    end

    describe "When forgetting your password" do
      it "should generate a new token" do
        expect{user.generate_token}.to change{user.password_token}
      end
    end
end
