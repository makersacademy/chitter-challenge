require 'pg'

describe User do
  describe '#add' do
    it 'adds a user to the database' do
      user = User.new(name: 'Hannah', password: 'password123', email: 'test@gmail.com')

      expect(user.name).to eq 'Hannah'
      expect(user.password).to eq 'password123'
      expect(user.email).to eq 'test@gmail.com'
    end
  end
end
