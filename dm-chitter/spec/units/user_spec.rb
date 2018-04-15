require 'chitter'

describe "User" do

subject(:user) {User.new(nil, "test@gmail.com", "abc123", "test", "tester123")}

  it "assigns the email and password from the controller to the user" do
    expect(user.email).to eq "test@gmail.com"
    expect(user.password).to eq "abc123"
    expect(user.name).to eq "test"
    expect(user.username).to eq "tester123"
  end

end
