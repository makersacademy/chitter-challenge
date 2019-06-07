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
      expect(user.pass).to eq("pass123")
    end
end 
