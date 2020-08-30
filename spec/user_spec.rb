require "user"

describe User do 
  describe "#create" do 
    it "Create a new user" do 
      new_user = User.create("Test User", "test@test.com", "pass123")
      expect(new_user.name).to eq "Test User"
      expect(new_user.email).to eq "test@test.com"
    end
  end

  describe "#log_in" do 
    it "Log in user as instance of class user" do 
      User.create("Test User", "test@test.com", "pass123")
      user = User.log_in("test@test.com", "pass123")
      expect(user).to be_an_instance_of(User)
      expect(user).to respond_to(:id)
      expect(user).to respond_to(:name)
      expect(user).to respond_to(:email)
    end

    it "Return error if user doesn't exist" do 
      expect(User.log_in("test@test.com", "pass123")).to eq "Email Error"
    end

    it "Return error if user doesn't exist" do 
      User.create("Test User", "test@test.com", "pass123")
      expect(User.log_in("test@test.com", "pass12")).to eq "Incorrect password"
    end

  end
end