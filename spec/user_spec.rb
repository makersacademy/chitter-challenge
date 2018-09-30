require 'user'

describe User do
  context ".create" do
    it "should store user in database" do
      user = User.create(email: "test@email.com", password: "password12345", username: "AbagnaleF", name: "Frank Abagnale")
      expect(user.email).to eq "test@email.com"
      expect(user.password).to eq "password12345"
      expect(user.username).to eq "AbagnaleF"
      expect(user.name).to eq "Frank Abagnale"
    end
  end

  context ".make" do
    it "should return User object for empty database" do
      expect(User.make(email: "test@email.com", password: "password12345", username: "AbagnaleF", name: "Frank Abagnale")).to be_instance_of(User)
    end

    it "should return false if email already in the database" do
      User.make(email: "test@email.com", password: "password12345", username: "AbagnaleF", name: "Frank Abagnale")
      expect(User.make(email: "test@email.com", password: "password12345", username: "FunkMaster", name: "Frank Abagnale")).to eq false
    end

    it "should return false if username already in the database" do
      User.make(email: "test@email.com", password: "password12345", username: "AbagnaleF", name: "Frank Abagnale")
      expect(User.make(email: "different@email.com", password: "password12345", username: "AbagnaleF", name: "Frank Abagnale")).to eq false
    end
  end
end
