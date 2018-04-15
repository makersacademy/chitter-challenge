require 'users'

describe User do
  describe '#username' do
    it 'returns the name of the user' do

      user_of_chitter = User.new('khl123')
      expect(user_of_chitter.username).to eq 'khl123'

    end
  end

  describe '.all' do
    it 'returns the usernames of chitter users as an array' do
      User.create({email: 'jbloggs@makersacademy.com', username: 'jbloggs', password: 'jbloggsrocks', name: 'Joe Bloggs'})
      User.create({email: 'ironman@makersacademy.com', username: 'iman123', password: 'imanrocks', name: 'Robert Downey Jr'})
      User.create({email: 'batman@makersacademy.com', username: 'batman123', password: 'savegotham', name: 'Bruce Wayne'})

      expected_users = ['jbloggs', 'iman123', 'bwayne']



    end
  end

  describe '.create' do
    it 'creates a user of chitter' do
      User.create({email: 'jbloggs@makersacademy.com', username: 'jbloggs', password: 'jbloggsrocks', name: 'Joe Bloggs'})
      expect(User.all).to include 'jbloggs'
    end
  end
end
