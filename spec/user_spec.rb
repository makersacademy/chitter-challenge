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
end
