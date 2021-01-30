require 'user'

describe User do

  describe '.create' do
    it 'creates a new User' do
      user = User.create(email: "sean@email.com", password: "password123", name: "Sean Test", username: "Seantest")

      expect(user).to be_a User
      expect(user.name).to eq 'Sean Test'
    end
  end

  describe '.log_in' do
    it 'returns a user with the right credentials' do
      user = User.create(email: "sean@email.com", password: "password123", name: "Sean Test", username: "Seantest")
      auth = User.log_in(username: "Seantest", password: "password123")

      expect(auth.id).to eq user.id
    end
  end
end
