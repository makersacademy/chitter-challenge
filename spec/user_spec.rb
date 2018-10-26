require 'user'

describe User do
  describe '#initialize' do
    it 'creates a new user and returns their name' do
      user = User.register('Aimee')
      expect(User.all[0].name).to eq 'Aimee'
    end
  end

  describe '#register' do
    it 'adds a user to the database' do
      User.register('Aimee')
      expect(User.all[0].name).to eq 'Aimee'
    end
  end
end
