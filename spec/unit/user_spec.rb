require 'user'
require 'pg'
require 'bcrypt'
require 'pg_help'

describe User do

  describe '.create' do
    it 'create a new user' do
      user = User.create(user_name: 'test_user_name', password: 'testpassword1', email: 'test@email.com')

      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.user_name).to eq 'test_user_name'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('testpassword1').and_return('@%£^£$^W%SFW%')
  
      User.create(user_name: 'test_user_name', password: 'testpassword1', email: 'test@email.com')
    end
  end

  describe '.find' do
    it 'finds a user by id' do
      user = User.create(user_name: 'test_user_name', password: 'testpassword1', email: 'test@email.com')
   
      result = User.find(id: user.id)
  
      expect(result.id).to eq user.id
      expect(result.user_name).to eq user.user_name
    end

    it 'returns nil if there is no id given' do
      expect(User.find(id: nil)).to eq nil
    end
  end
  
end