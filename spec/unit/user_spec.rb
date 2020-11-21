require 'user'

describe User do
  it "creates an instance of user with an id, username, email, and password" do
    partario = User.new(id: 1, username: "partario", email: "test@email.com")
    expect(partario.username).to eq("partario")
    expect(partario.email).to eq("test@email.com")
    expect(partario.id).to eq(1)
  end

  describe ".create" do
    it "adds a user to the database, returning an object with the created user" do
      partario = User.create(username: "partario", email: "test@email.com", password: "1234")
      expect(partario.username).to eq("partario")
      expect(partario.email).to eq("test@email.com")
    end

    it "salts the password for security" do
      expect(BCrypt::Password).to receive(:create).with('1234')
      User.create(username: "partario", email: "test@email.com", password: "1234")
    end

    it "returns false if username exists" do
      partario = User.create(username: "partario", email: "test@email.com", password: "1234")
      partario2 = User.create(username: "partario", email: "different@email.com", password: "1234")
      expect(partario2).to eq(false)
    end

    it "returns false if email exists" do
      partario = User.create(username: "partario", email: "test@email.com", password: "1234")
      not_partario = User.create(username: "vera", email: "test@email.com", password: "1234")
      expect(not_partario).to eq(false)
    end

    it "doesn't make anything case sensitive (except password)" do
      partario = User.create(username: "PARTARIO", email: "TEST@EMAIL.COM", password: "1234")
      returned_user = User.find(partario.id)
      expect(returned_user.username).to eq(partario.username.downcase)
      expect(returned_user.email).to eq(partario.email.downcase)
    end
  end

  describe ".find" do
    it "returns a User matching the specified ID" do
      partario = User.create(username: "partario", email: "test@email.com", password: "1234")
      returned_user = User.find(partario.id)
      expect(returned_user.id).to eq(partario.id)
      expect(returned_user.username).to eq(partario.username)
      expect(returned_user.email).to eq(partario.email)
    end
  end

  describe ".authenticate" do
    it "returns the user if given a correct username and password combo" do
      partario = User.create(username: "partario", email: "test@email.com", password: "1234")
      returned_user = User.authenticate(username: "partario", password: "1234")
      expect(returned_user.id).to eq(partario.id)
    end

    it "returns false if given an incorrect combo" do
      partario = User.create(username: "partario", email: "test@email.com", password: "1234")
      returned_user = User.authenticate(username: "partario", password: "4321")
      expect(returned_user).to eq(false)
    end

    it "returns false if username doesn't exist" do
      returned_user = User.authenticate(username: "partario", password: "4321")
      expect(returned_user).to eq(false)
    end
  end
end