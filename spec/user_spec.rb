require 'user'

describe User do
  describe '.create' do
    it 'creates new user' do
      user = User.create('test@gmail.com', 'password123')
      persisted_data = DatabaseConnection.query(
        "SELECT * FROM users WHERE id=$1;",
        [user.id]
      )
      
      expect(user).to be_a User
      expect(user.id).to eq persisted_data[0]['id']
      expect(user.email).to eq 'test@gmail.com'
    end
  end
end