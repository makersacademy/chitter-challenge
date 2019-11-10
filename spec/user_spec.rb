require "user"

describe User do
  describe ".new" do
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
  end


  context '.create' do
    it 'creates a new user' do
      test_user = User.create('Robert', 'Rosiji', 'test@gmail.com', 'password123')
      expect(test_user.email).to eq('test@gmail.com')
      expect(test_user.first).to eq('Robert')
      expect(test_user.last).to eq('Rosiji')
    end
  end

  describe '.find' do
    context 'a User exists in the data base' do
      test_user = User.create('Robert', 'Rosiji', 'test@gmail.com', 'password123')
      it 'finds a user from the database' do
        expect(User.find(test_user.email)).to include(test_user.email)
      end
    end

    context 'A User does not exist in the database' do
      it "returns nil if user does not exist" do
        expect(User.find('invalid@email.com')).to eq(nil)
      end
    end
  end

  describe ".authenticate" do
    context 'A user enters the correct email and password' do
      result = User.find('test@gmail.com')
      it 'returns true if the email and password are correct' do
        expect(User.authenticate('test@gmail.com', 'password123')).to eq(true)
      end

      it 'returns false if the email is correct but password is incorrect' do
        expect(User.authenticate('test@gmail.com', 'password')).to eq(false)
      end

      it 'returns false if the email is incorrect' do
        expect(User.authenticate('tester@gmail.com', 'password')).to eq(false)
      end
    end
  end

end