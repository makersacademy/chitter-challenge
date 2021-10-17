require 'user'

describe User do
  it "creates a user" do
    user = User.create(username: "Dajox", password: "password")

    expect(user).to be_a User
    expect(user.name).to eq "Dajox"
  end
end
