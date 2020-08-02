require 'user'
require 'database_helpers'

describe User do

  describe '.all' do
    it 'returns a list of users' do
      user = User.create(
        username: 'FirstAuthor',
        email: 'test@makers.com',
        password: '12345'
      )
      users = User.all
      
      expect(users.length).to eq 1
      expect(users.first).to be_a User
      expect(users.first.id).to eq user.id
      expect(user.username).to eq 'FirstAuthor'
      expect(user.email).to eq 'test@makers.com'
      expect(user.password).to eq '12345'
    end
  end
  
  describe '.create' do
    it 'adds a new user to the database' do
      user = User.create(
        username: 'FirstAuthor',
        email: 'test@makers.com',
        password: '12345'
      )
      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.username).to eq 'FirstAuthor'
      expect(user.email).to eq 'test@makers.com'
      expect(user.password).to eq '12345'
    end
  end

  describe '.find' do

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end

    it 'finds a user by ID' do
      user = User.create(
        username: 'FirstAuthor',
        email: 'test@makers.com',
        password: '12345'
      )
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
    end
  end
end
