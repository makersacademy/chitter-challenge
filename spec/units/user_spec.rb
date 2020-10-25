describe User do
  it "can retreive a username using an Object Relational Mapper" do
    expect(User.find(1).username).to eq "ds.danielh"
  end

  describe ".register" do
    it "hashes the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with("hunter2")

      User.register(username: "ds.danielh", full_name: "Dan Holmes", email: "dan@gmail.com", password: "hunter2")
    end

    it "calls the Active Record method 'create'" do
      expect(User).to receive(:create)

      User.register(username: "ds.danielh", full_name: "Dan Holmes", email: "dan@gmail.com", password: "hunter2")
    end
  end

  describe ".authenticate" do
    it "checks a username and password combo, and returns the user if valid" do
      User.register(username: "ds.danielh", full_name: "Dan Holmes", email: "dan@gmail.com", password: "hunter2")
      user = User.authenticate(username: "ds.danielh", password: "hunter2")
      expect(user.id).to eq 1
    end
    it "returns nil if invalid username" do
      user = User.authenticate(username: "MarkyZ", password: "tryingmyluck")
      expect(user).to be_nil
    end
    it "returns nil if invalid password" do
      User.register(username: "ds.danielh", full_name: "Dan Holmes", email: "dan@gmail.com", password: "hunter2")
      user = User.authenticate(username: "ds.danielh", password: "nicetry")
      expect(user).to be_nil
    end
  end
end
