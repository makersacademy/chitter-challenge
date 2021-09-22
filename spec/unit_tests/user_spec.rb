require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'CRISPR', email: 'crispr@yahoo.com', password: '123456')
    
      expect(user).to be_a User
      expect(user.username).to eq 'CRISPR' 
      expect(user.email).to eq 'crispr@yahoo.com'
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
end