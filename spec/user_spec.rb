require 'user'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: "John Smith", email: "john@smith.com", username: "johnsmith1", password: "password123")

      expect(user).to be_a(User)
      expect(user.name).to eq("John Smith")
      expect(user.username).to eq("johnsmith1")
    end
  end

  describe '.log_in' do
    it 'returns a user with the right log in details' do
      user = User.create(email: "test@test.com", password: "Any123", name: "Bill Test", username: "Billtest")
      auth = User.log_in(username: "Billtest", password: "Any123")

      expect(auth.id).to eq user.id
    end
  end
end
