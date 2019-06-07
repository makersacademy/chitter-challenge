require "user"

describe User do
  it "encryps users password with ruby BCrypt" do
    expect(BCrypt::Password).to receive(:create).with("pass123")
    User.create("SueprMario", "Emma@me.com", "pass123")
  end
end
describe User do
  before(:each) do
    connect_delete_and_create_data
  end
  it "can be registered" do
    connect_delete_and_create_data

    # what is a good assertion here
  end

  it "find a user by email" do
    user = User.find("Emma@me.com")
    expect(user.email).to eq("Emma@me.com")
    expect(user.id).to eq("3")
  end

  it "find a user by id" do
    user = User.find_by_id(3)
    expect(user.email).to eq("Emma@me.com")
  end

  it "returns nil if no id given" do
    user = User.find_by_id(nil)
    expect(user).to eq(nil)
  end

  it "lists all of the users" do
    connect_delete_and_create_data
    expect(User.all.length).to eq 3
    expect(User.all.last.name).to eq("Tortoise")
  end

  # it "returns nil if no email found" do
  #   user = User.find("Ada@me.com")
  #   expect(user.length).to eq(0)
  # end
end


