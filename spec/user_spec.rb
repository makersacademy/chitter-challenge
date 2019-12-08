require 'user'

describe "signing up" do
  it "creates a new user" do
    
    user = User.sign_up(email: "test@mail.com", password: "password")
    expect(user).to be_a User
    expect(user.email).to eq "test@mail.com"
  end
end