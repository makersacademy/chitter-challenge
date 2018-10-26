require 'user'

describe User do
  describe '#initialize' do
    it 'creates a new user and returns their name' do
      user = User.new('Aimee')
      expect(user.name).to eq 'Aimee'
    end
  end
end
