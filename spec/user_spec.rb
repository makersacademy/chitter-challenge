require 'user'
require 'database_helpers'

describe User do
  describe '#initialize' do
    it 'creates a new user and returns their name' do
      user = User.register('Aimee')
      expect(user.name).to eq find_by_id(id: user.id)['name']
    end
  end

  describe '#register' do
    it 'adds a user to the database' do
      user = User.register('Aimee')
      result = find_by_id(id: user.id)
      expect(user.name).to eq result['name']
    end
  end
end
