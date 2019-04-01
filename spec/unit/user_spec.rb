# TO DO pending mocking for TAG
require 'user'
require 'bcrypt'

describe User do


  describe '.create' do
    it 'hashes the password' do
      expect(BCrypt::Password).to receive(:create).with('123456789')
      User.create(name: 'My_name', username: 'My_username_test', email:'myname_2@gmail.com', password:'123456789')
    end

    it 'when sending the create message to Peep class' do
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      expect(user.name).to eq 'My_name'
      expect(user.username).to eq 'My_username'
      expect(user.email).to eq 'myname@gmail.com'
    end

    it 'adds his username as a handle to the tags table' do
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      result = Tag.find_id(tag_id: user.id)
      expect(result.content).to eq user.username
    end
  end

  describe '.authenticate' do
    it 'finds a user if username matches' do
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      authenticated_user = User.authenticate(user: 'My_username', password: 'some_password')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if incorrect username' do
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      expect( User.authenticate(user: 'Mysername', password: 'some_password') ).to be_nil
    end

    it 'returns nil if incorrect password' do
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      expect(User.authenticate(user: 'My_username', password: 'wrong_password')).to be_nil
    end
  end

  describe 'find_id' do
    it 'finds user by id' do
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      expect(User.find_id(user.id).username).to eq user.username
    end
  end

end