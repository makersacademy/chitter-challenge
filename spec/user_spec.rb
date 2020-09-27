require 'user'
require 'web_helpers'

describe User do
  describe '#.create' do
    it 'creates a new user' do
      user = User.create('ollie@gmail.com', 'password123')
      expect(user).to be_a User
      expect(user.email).to eq 'ollie@gmail.com'
      expect(user.password).to eq 'password123'
    end
  end

  describe '#.check_password' do
    it 'returns true if the password matches the database for that email' do
      clear_table
      User.create('ollie@gmail.com', 'password123')
      expect(User.check_password('ollie@gmail.com', 'password123')).to eq true
    end
  end

  describe '#.log_in' do
    it 'logs a user in if the password matches the database for that email' do
      clear_table
      User.create('ollie@gmail.com', 'password123')
      user = User.log_in('ollie@gmail.com', 'password123')
      expect(user.logged_in).to eq true
    end
  end

  describe '#.show' do
    it 'shows the user that is surrently logged in' do
      clear_table
      User.create('ollie@gmail.com', 'password123')
      User.log_in('ollie@gmail.com', 'password123')
      expect(User.show).to be_a User
      expect(User.show.email).to eq 'ollie@gmail.com'
      expect(User.show.logged_in).to eq true
    end
  end

  describe '#.log_out' do
    it 'logs out the user' do
      clear_table
      User.create('ollie@gmail.com', 'password123')
      User.log_in('ollie@gmail.com', 'password123')
      User.log_out
      expect(User.show).to eq nil
    end
  end
end
