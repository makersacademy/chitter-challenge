require 'user'
require 'database_helpers'

 describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Aga', username: 'Agausername', email: 'test@example.com', password: 'password123')
      persisted_data = persisted_data(id: user.id, table: 'users')
      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.name).to eq 'Aga'
      expect(user.username).to eq 'Agausername'
      expect(user.email).to eq 'test@example.com'
    end

     it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
       User.create(name: 'Aga', username: 'Agausername', email: 'test@example.com', password: 'password123')
    end
  end
end
