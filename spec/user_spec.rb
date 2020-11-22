require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new User' do
      user = User.create(email: "down@email.com", password: "Any123", name: "Bill Test", username: "Billtest")

      expect(user).to be_a User
      expect(user.name).to eq 'Bill Test'
    end

    it 'does not create a new user if the email address is not valid' do
      user = User.create(email: "wrong", password: "Any123", name: "Bill Test", username: "Billtest")
      expect(user).not_to be_a User
    end
  end

  describe '.authenticate' do
    it 'returns a user with the right credentials' do
      user = User.create(email: "test@test.com", password: "Any123", name: "Bill Test", username: "Billtest")
      auth = User.authenticate(username: "Billtest", password: "Any123")

      expect(auth.id).to eq user.id
    end
  end
end
