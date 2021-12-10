require 'user'

describe User do

  context "#create"
  it "should create user" do
    user = User.create("Kim", "kim-morgan", "kim_fake_email@gmail.com", "password123")
    expect(user.name).to eq "Kim"
    expect(user.username).to eq "kim-morgan"
    expect(user.email).to eq "kim_fake_email@gmail.com"
  end

end