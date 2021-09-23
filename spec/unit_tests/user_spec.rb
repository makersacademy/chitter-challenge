require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'CRISPR', email: 'crispr@yahoo.com', password: '123456')
    
      expect(user).to be_a User
      expect(user.username).to eq 'CRISPR' 
      expect(user.email).to eq 'crispr@yahoo.com'
    end
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('123456')
     
      User.create(username: 'CRISPR', email: 'crispr@yahoo.com', password: '123456')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(username: 'CRISPR', email: 'crispr@yahoo.com', password: '123456')
      result = User.find(value: user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password' do
      user = User.create(username: 'CRISPR', email: 'crispr@yahoo.com', password: '123456')
      authenticated_user = User.authenticate('crispr@yahoo.com', '123456')

      expect(authenticated_user.id).to eq user.id
    end
    it 'returns nil given an incorrect email' do
      user = User.create(username: 'CRISPR', email: 'crispr@yahoo.com', password: '123456')
      expect(User.authenticate('northenlights@yahoo.com', '123456')).to eq nil
    end
    it 'returns nil given an incorrect password' do
      user = User.create(username: 'CRISPR', email: 'crispr@yahoo.com', password: '123456')
      expect(User.authenticate('crispr@yahoo.com', '111111')).to eq nil
    end
  end

end