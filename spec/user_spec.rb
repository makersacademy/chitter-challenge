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

  describe '.find' do
    it 'finds user by ID' do 
      user = User.create('test@gmail.com', 'password123')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email  
    end 

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

end