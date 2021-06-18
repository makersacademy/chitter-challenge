require 'user'
require './spec/database_helpers.rb'

RSpec.describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create('Bob', 'test@example.com', 'password123')
      query_data = query_data('users', user.id)

      expect(user).to be_a User
      expect(user.id).to eq(query_data['id'])
      expect(user.first_name).to eq('Bob')
    end
  end

  describe '.find' do
    it 'finds a specific user' do
      user = User.create('Bob', 'test@example.com', 'password123')
      result = User.find(user.id)

      expect(result.id).to eq(user.id)
      expect(result.first_name).to eq(user.first_name)
    end

    it 'returns nil if there is no id' do
      expect(User.find(nil)).to eq nil
    end
  end
end