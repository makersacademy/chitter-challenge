require 'user'
require 'pry'

describe User do
  describe '#create' do
    it 'can be created with first and last name, email, username and password' do
      user = User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      expect(user.first_name).to eq('amy')
      expect(user.last_name).to eq('smith')
      expect(user.email).to eq('amy.smith@mail.com')
      expect(user.username).to eq('AmyS')
    end
  end

  describe '#all_users' do
    it 'can return all user objects from the database' do
      user1 = User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      user2 = User.create('jack', 'black', 'jack.black@mail.com', 'JackB', 'oaks')
      users = User.all_users
      expect(users[0].first_name).to eq('amy')
      expect(users[1].first_name).to eq('jack')
    end
  end

  describe '#find' do
    it 'find a user in the database by id' do
      user1 = User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      expect(User.find(user1.user_id).user_id).to eq(user1.user_id)
    end
  end

  describe '#authenticate' do

    it 'rejects a user if username is incorrect' do
      user1 = User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      expect(User.authenticate('Amy', 'pines')).to_not be_an_instance_of(User)
    end

    it 'rejects a user if password is incorrect' do
      user1 = User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      expect(User.authenticate('AmyS', 'wrong_password')).to_not be_an_instance_of(User)
    end

    it 'accepts a user if both username and password are correct' do
      user1 = User.create('amy', 'smith', 'amy.smith@mail.com', 'AmyS', 'pines')
      expect(User.authenticate('AmyS', 'pines')).to be_an_instance_of(User)
    end
  end
end
