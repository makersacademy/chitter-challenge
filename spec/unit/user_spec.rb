require 'user_signin_create_helper'
require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = create_user

      expect(user).to be_a User
      expect(user.email).to eq 'amy@testemail.com'
      expect(user.name).to eq 'Amy Jordan'
      expect(user.username).to eq 'amy123'
    end

    it 'hashes the password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password')

      create_user
    end
  end

  describe '.find' do
    it 'find a user by ID' do
      user = create_user
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end

    it 'returns nil if no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct name and password, if one exists' do
      user = create_user
      authenticated_user = User.authenticate(username: 'amy123', password: 'password')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if an incorrect password is given' do
      create_user

      expect(User.authenticate(username: 'amy123', password: 'p4ssword')).to be_nil
    end

    it 'returns nil if an incorrect username is given' do
      create_user

      expect(User.authenticate(username: 'amy111', password: 'password')).to be_nil
    end
  end
end
