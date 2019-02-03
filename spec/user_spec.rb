require 'user'
require_relative 'features/web_helpers'

describe User do

  describe '.add_new' do
    it 'creates a new user' do
      user = User.add_new(name: 'TestName', email: 'test@example.com', password: 'password123')

      persisted_data = persisted_data(id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.add_new(name: 'TestName', email: 'test@example.com', password: 'password123')
      result = User.find(id: user)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  # it 'should return all stored users in an array' do
  #   user = User.add_new("Jane", "jane@jane.com", "janepass")
  #   expect(User.all).to be_a Array
  #   expect(User.all.first).to be_a User
  # end
  #
  # it 'should add a user' do
  #   user = User.add_new("Jane", "jane@jane.com", "janepass")
  #   expect(User.all.last.name).to eq "Jane"
  # end
  #
  # it 'should retrive user data given the session id' do
  #   user = User.add_new("Jane", "jane@jane.com", "janepass")
  #   search = User.find(1)
  #   expect(search.last.name).to eq "Jane"
  # end

end
