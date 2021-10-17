require 'user'

describe User do
  describe '.new' do
    it "should create a new user" do
      expect(User.create(username: 'tim456', name: 'tim james', email: 'tim@gmail.com', password: '42jk3l4j2l').username).to eq('tim456')
    end
  end
  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(username: 'test456', name: 'test guy', email: 'test@example.com', password: 'password123')
      result = User.find(user)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
  
end