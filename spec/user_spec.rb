require "user.rb"

describe User do

  before(:each) {
    @user = described_class.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
  }

  it "new" do
    @user = described_class.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    expect(@user.name).to eq "John"
    expect(@user.email).to eq "email@hotmail.com"
  end

  it "login" do
    user2 = described_class.login(name: "John", password: "password")
    expect(@user.name).to eq user2.name
  end

  it "incorrect password" do
    expect(described_class.login(name: "John", password: "password1")).to eq "Incorrect password"
  end

  it "invalid user" do
    expect(described_class.login(name: "John9543", password: "password")).to eq "No such user"
  end

  it "email with password" do
    expect(described_class.send_password_email(name: "John", email: "email@hotmail.com")).to eq "Email sent"
  end

  it "no password email for invalid user " do
    expect(described_class.send_password_email(name: "John8742", email: "email@hotmail.com")).to eq "No such user"
  end

end
