require "user"

describe User do 
  describe "#create" do 
    it "Create a new user" do 
      new_user = User.create("Test User", "test@test.com", "pass123")
      expect(new_user.name).to eq "Test User"
      expect(new_user.email).to eq "test@test.com"
    end

    it "Return error if user is already registred" do 
      User.create("Test User", "test@test.com", "pass123")
      expect(User.create("Test User", "test@test.com", "pass123")).to eq "Email Error"
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

  describe "#encrypt" do 
    it "Encrypt user password" do 
      User.create("Test", "test@test.com", "pass123")
      get_password = DataBase.query("SELECT password FROM users WHERE name='Test'")
      expect(get_password[0]["password"]).not_to eq "pass123"
    end
  end

end