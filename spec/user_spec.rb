require 'pg'
require 'spec_helper'
require 'user'
require 'bcrypt'

describe User do

  describe '.create' do
    it 'should create a new peep user' do
      test_user = User.create(username: "Peeping Sally", password: 'helikespeeping')
      expect(User.all).to include test_user
    end
    #
    # it 'should hash the password using BCrypt' do
    #   expect(BCrypt::Password).to receive(:create).with('password123')
    #   User.create(username: 'Test User', password: 'password123')
    # end
  end

  describe '.get' do
    it 'should find a user by their id' do
      test_user = User.create(username: "Peeping Sally", password: 'helikespeeping')
      expect(User.get(test_user.id).username).to eq test_user.username
    end
    it 'returns nil if there is no ID given' do
      expect(User.get(nil)).to eq nil
  end
  end

end
