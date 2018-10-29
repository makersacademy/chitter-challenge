require 'user'
require 'pry'

describe User do
  describe '#create' do
    it 'can be created with name, email, username and password' do
      user = User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      expect(user.first_name).to eq('amy')
      expect(user.last_name).to eq('smith')
      expect(user.email).to eq('amy.smith@mail.com')
      expect(user.username).to eq('AmyS')
    end
  end

  describe '#all_users' do
    it 'can return all users' do
      User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      User.create('jack', 'black', 'jack.black@mail.com', 'JackB', 'oaks')
      users = User.all_users
      expect(users[0].first_name).to eq('amy')
      expect(users[1].first_name).to eq('jack')
    end
  end

  describe '#find' do
    it 'can find a user by id' do
      user = User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      expect(User.find(user.user_id).user_id).to eq(user.user_id)
    end
  end

  describe '#authenticate' do

    it 'rejects a user if username is incorrect' do
      User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      expect(User.authenticate('Amy', 'pines')).to_not be_an_instance_of(User)
    end

    it 'rejects a user if password is incorrect' do
      User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      expect(User.authenticate('AmyS', 'wrong_password')).\
      to_not be_an_instance_of(User)
    end

    it 'accepts a user if both username and password are correct' do
      User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      expect(User.authenticate('AmyS', 'pines')).to be_an_instance_of(User)
    end
  end
end
