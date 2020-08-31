require 'users'

describe User do

  describe '.new_user' do
    it 'creates new user' do
      user = User.new_user(username: 'Homer', email: 'homersimpson@gmail.com', password: 'spiderpig')
      expect(user).to be_a User
      expect(user.username).to eq 'Homer'
      expect(user.email).to eq 'homersimpson@gmail.com'
    end

    it 'checks that user password is encrypted' do
      user = User.new_user(username: 'Homer', email: 'homersimpson@gmail.com', password: 'spiderpig')
      expect(user.password).not_to eq 'spiderpig'
    end
  end

  describe '.login' do
    it 'throws an error if username does not exist in database' do
      expect(User.login(username: "homer", password: "spiderpig")).to eq "Wrong username"
    end

  end

end
