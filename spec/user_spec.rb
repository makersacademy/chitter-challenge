require "user"

RSpec.describe "USER" do
  include Rack::Test::Methods

  it "creates a user" do
    user = User.create(email: "bob@gmail.com", password: "test", first_name: "Bob", username: "Bobby")
    expect(user.email).to eq "bob@gmail.com"
  end

  it "find a user" do
    user = User.find_by(username: "Bob123")
    expect(user.email).to eq "Bob@gmail.com"
  end

  it "returns all users" do
    user = User.all
    expect(user.length).to eq 3
  end

  it "deltes a user" do
    user = User.delete_all

    expect(User.all.length).to eq 0
  end
end
