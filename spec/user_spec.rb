require "user"

describe User do 
  describe "#create" do 
    it "Create a new user" do 
      new_user = User.create("Test User", "test@test.com", "pass123")
      expect(new_user.entries['name']).to eq "Test User"
      expect(new_user.entries['email']).to eq "test@test.com"
    end
  end
end