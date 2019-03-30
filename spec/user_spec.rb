require 'bcrypt'
require 'user'

describe User do
  describe '.create_secure' do
    it 'creates a new user with an encrypted password' do
      user = User.create_secure(name: "Joe Bloggs",
                                username: "jblogg",
                                email: "joe@bloggs.com",
                                password: "password123")
      all_users = User.all

      expect(user).to be_a User
      expect(user.id).to eq all_users.first.id
      expect(user.name).to eq 'Joe Bloggs'
      expect(user.username).to eq 'jblogg'
      expect(user.password).to be_a BCrypt::Password
      expect(user.password).to eq 'password123'
    end
  end

  describe '.encrypt_password' do
    it 'returns a BCrypted string' do
      hashed_password = User.encrypt_password("my password")
      expect(hashed_password).to be_a BCrypt::Password
      expect(hashed_password).to eq "my password"
    end
  end
end
