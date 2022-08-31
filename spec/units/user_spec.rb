require 'user'

describe User do
  describe '.create' do
    it 'adds a user to the database' do
      new_user = User.create(username: 'testname', password: 'password123')
      
      result = DatabaseConnection.query('SELECT * FROM users;')
      expect(result[0]['username']).to eq new_user.username
      expect(result[0]['id']).to eq new_user.user_id
    end
  end
end
