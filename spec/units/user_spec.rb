require 'user'

describe User do
  context '.create' do
    it 'can create a new user' do
      user = User.create('me@example.com', 'password1234')
      expect(user).to be_a(User)
      expect(user.id).to eq ('2')
      expect(user.email).to eq('me@example.com')
    end
    it 'existing user can\'t be created' do
      user = User.create('me@example.com', 'password1234')
      user = User.create('me@example.com', 'password1234')
      expect(user).to eq('me@example.com is already signed up')
    end
    it 'can\'t create user with an invalid email' do
      user = User.create('me.example.com', 'password1234')
      expect(user).to eq('me.example.com is not a valid email')
    end
  end
  context '.authenticate' do
    it 'can authenticate a user' do
      User.create('me@example.com', 'password1234')
      user = User.authenticate('me@example.com', 'password1234')
      expect(user).to be_a(User)
      expect(user.id).to eq ('2')
      expect(user.email).to eq('me@example.com')
    end
    it 'returns nil if user not found' do
      user = User.authenticate('nobody@example.com', 'password1234')
      expect(user).to be_nil
    end
    it 'returns nil if password incorrect' do
      User.create('me@example.com', 'password1234')
      user = User.authenticate('me@example.com', 'secretpassword')
      expect(user).to be_nil
    end
  end
  context '.find' do
    it 'can find a user' do
      user = User.find(1)
      expect(user).to be_a(User)
      expect(user.id).to eq ('1')
      expect(user.email).to eq('admin@chitter.com')
    end
  end
end
