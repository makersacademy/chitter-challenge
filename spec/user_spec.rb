describe User do

  describe 'login' do
    it "authenitcates an existing user" do
      @user = User.create(email: "ollie@chitter.com", password: "password123", name: "Ollie", username: "ollie4carol")
      user = User.authenticate(email: "ollie@chitter.com", password: "password123")
      expect(user).to be_a(User)
      expect(user.id).to eq(@user.id)
    end

    it "returns nil if the email doesn't exist in the database" do
      @user = User.create(email: "ollie@chitter.com", password: "password123", name: "Ollie", username: "ollie4carol")
      user = User.authenticate(email: "another_person@chitter.com", password: "password123")
      expect(user).to eq(nil)
    end

    it "returns nil if the password doesn't match the email address" do
      @user = User.create(email: "ollie@chitter.com", password: "password123", name: "Ollie", username: "ollie4carol")
      user = User.authenticate(email: "ollie@chitter.com", password: "another_password")
      expect(user).to eq(nil)
    end
  end
end
