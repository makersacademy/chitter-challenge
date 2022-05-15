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

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create('test@gmail.com', 'password123')
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

  describe '.authenticate' do
    it 'returns a registered user' do
      user = User.create('test@gmail.com', 'password123')
      registered_user = User.authenticate('test@gmail.com', 'password123')

      expect(registered_user.id).to eq user.id
    end

    it 'returns nil for unregistered email' do
      user = User.create('test@gmail.com', 'password123')
      unregistered_user = User.authenticate('otheremail@gmail.com', 'password123')

      expect(unregistered_user).to be_nil
    end
  end

end