require "user.rb"

describe User do

  it "Create a new user" do
    user = described_class.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    expect(user.name).to eq "John"
    expect(user.email).to eq "email@hotmail.com"
    #expect(user.receive_email).to eq "y"
  end

  it "Login valid user with correct password" do
    user1 = described_class.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    user2 = described_class.login(name: "John", password: "password")
    expect(user1.name).to eq user2.name
  end

  it "Does not login valid user with incorrect password" do
    user = described_class.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    expect(described_class.login(name: "John", password: "password1")).to eq "Incorrect password"
  end

  it "Does not login invalid user" do
    user = described_class.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    expect(described_class.login(name: "John9543", password: "password")).to eq "No such user"
  end

  it "sends out email to valid user with correct password" do
    user = described_class.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    expect(described_class.send_password_email(name: "John", email: "email@hotmail.com")).to eq "Email sent"
  end

  it "Does not send out password email to invalid user " do
    user = described_class.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    expect(described_class.send_password_email(name: "John8742", email: "email@hotmail.com")).to eq "No such user"
  end

end
