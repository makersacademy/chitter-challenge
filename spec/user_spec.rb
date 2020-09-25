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

  describe '#.all' do
    it 'lists the table of users' do
      clear_table
      User.create('ollie@gmail.com', 'password123')
      User.create('bryony@gmail.com', 'password1234')
      expect(User.all[0].email).to eq 'ollie@gmail.com'
      expect(User.all[1].email).to eq 'bryony@gmail.com'
      expect(User.all[0].password).to eq 'password123'
      expect(User.all[1].password).to eq 'password1234'
    end
  end
end
