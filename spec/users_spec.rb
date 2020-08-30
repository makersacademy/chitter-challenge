require 'users'

describe User do

  describe '.new_user' do
    it 'creates new user' do
      user = User.new_user(username: 'Homer', email: 'homersimpson@gmail.com', password: 'spiderpig')
      expect(user).to be_a User
      expect(user.username).to eq 'Homer'
      expect(user.email).to eq 'homersimpson@gmail.com'
      expect(user.password).to eq 'spiderpig'
    end
  end
end
