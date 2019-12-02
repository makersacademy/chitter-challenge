require 'pg'
require './lib/user'

describe User do

  subject(:user) { described_class.new(9, "Test", "test123", "test@test.com", "testpassword4") }

  it "can create a new user" do
    expect(user).to be_instance_of(User)
  end

  it "can create a new user with an id" do
    expect(user.id).to eq(9)
  end

  it "can create a new user with a name" do
    expect(user.author_name).to eq("Test")
  end

  it "can create a new user with a handle" do
    expect(user.author_handle).to eq("test123")
  end

  it "can create a new user with an email" do
    expect(user.email).to eq("test@test.com")
  end

  it "can create a new user with a password" do
    expect(user.password).to eq("testpassword4")
  end

  it "can create a new entry in the database" do
    User.create("Test", "test123", "test@test.com", "testpassword4")
    expect(User.all[0]).to be_instance_of(User)
  end

end
