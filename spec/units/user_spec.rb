require 'spec_helper'
require './app/models/user'

describe User do

  context "when I manually create a new user" do
    it "the user count should go up by 1" do
      expect{User.create(first_name: "test_first_name",
        last_name: "test_last_name",
        email: "test_user@email.com",
        user_name: "test_username",
        password_digest: "test_password")
      }.to change{User.count}.by(+1)
    end
  end
end
