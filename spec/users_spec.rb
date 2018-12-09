require "users"

describe User do
  it "creates a user test with password password" do
    user = User.create("test_user", "password")
    expect(user.username).to eq "test_user"
  end
  it "returns false if username doesn't already exist" do
    expect(User.already_exists?("hello")).to eq false
  end
  it "returns true if username already exists" do
    expect(User.already_exists?("test")).to eq true
  end
  it "finds a user by username - test_user" do
    user = User.create("test_user", "password")
    user = User.find_user("test_user")
    expect(user.username).to eq "test_user"
  end
  it "authenticates a user with correct user and pass" do
    User.create("test_user", "password")
    expect(User.authenticate("test_user", "password").username).to eq "test_user"
  end
  it "returns false for incorrect username" do
    User.create("test_user", "password")
    expect(User.authenticate("incorrect_user", "password")).to eq false
  end
  it "returns false for incorrect password" do
    User.create("test_user", "password")
    expect(User.authenticate("test_user", "incorrect")).to eq false
  end
end
