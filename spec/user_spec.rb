require "user"

describe User do
  context 'initialize' do
    user = User.new('Robert', 'Rosiji', 'test@gmail.com', 'password123', '1')

    it 'has a first name' do
      expect(user.first).to eq('Robert')
    end

    it 'has a last name' do
      expect(user.last).to eq('Rosiji')
    end

    it 'has an email address' do
      expect(user.email).to eq('test@gmail.com')
    end

    it 'has an id' do
      expect(user.id).to eq('1')
    end
  end


  context '.create' do
    it 'creates a new user' do
      test_user = User.create('Robert', 'Rosiji', 'test@gmail.com', 'password123')
      expect(test_user.email).to eq('test@gmail.com')
      expect(test_user.first).to eq('Robert')
      expect(test_user.last).to eq('Rosiji')
    end
  end

  context '.find' do
    test_user = User.create('Robert', 'Rosiji', 'test@gmail.com', 'password123')
    it 'finds a user from the database' do
      expect(User.find(test_user.id)).to include(test_user.id.to_s)
    end
  end

end