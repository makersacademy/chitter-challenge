require 'user'

describe User do
  it "can be registered" do
    connect_delete_and_create_data
    user = User.create("Emma@me.com", "pass123")
    # what is a good assertion here
  end

    it "find a user by email" do
      connect_delete_and_create_data
      User.create("Emma@me.com", "pass123")
      user = User.find("Emma@me.com")
      expect(user.email).to eq("Emma@me.com")
      expect(user.id).to eq("1")
    end

    it "find a user by id" do
      connect_delete_and_create_data
      User.create("Emma@me.com", "pass123")
      user = User.find_by_id(1)
      expect(user.email).to eq("Emma@me.com")
    end

    it "returns nil if no id given" do
      connect_delete_and_create_data
      User.create("Emma@me.com", "pass123")
      user = User.find_by_id(nil)
      expect(user).to eq(nil)
    end
end 
