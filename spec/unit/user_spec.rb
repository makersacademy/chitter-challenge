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
  end
end