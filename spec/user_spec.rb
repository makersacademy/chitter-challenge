require 'database_cleaner'
require_relative 'spec_helper'

describe User do

  xit "should be created, retrieved from the database and then deleted" do
    expect(User.count).to eq 0
    User.create(name: "Alex",
              username: "AlexHandy1",
              email: "ah.com",
              password: "123",
              password_confirmation: "123") #how do you test password_digest creation?

    expect(User.count).to eq 1
    user = User.first

    expect(user.name).to eq "Alex"
    expect(user.username).to eq "AlexHandy1"
    expect(user.email).to eq "ah.com"
    expect(user.password).to eq "123"
    expect(user.password_confirmation).to eq "123"

    User.destroy
    expect(User.count).to eq 0
  end
end