require "user"

describe User do 
  describe "#create" do 
    it "Create a new user" do 
      new_user = User.create("Test User", "test@test.com", "pass123")
      expect(new_user.entries[0]['name']).to eq "Test User"
      expect(new_user.entries[0]['email']).to eq "test@test.com"
    end
  end

  describe "#log_in" do 
    it "Log in user as instance of class user" do 
      User.create("Test User", "test@test.com", "pass123")
      user = User.log_in("test@test.com", "pass123")
      expect(user).to be_an_instance_of(User)
    end
  end
end