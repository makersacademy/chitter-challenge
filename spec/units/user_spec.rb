require_relative '../../app/models/user'

describe User do
  subject(:user) { described_class.new(username: 'testusername', email: 'test@test.com', name: 'testuser', password: 'test') }

  describe '#initialize' do
    it 'has username, email and name' do
      expect(user.username).to eq 'testusername'
      expect(user.email).to eq 'test@test.com'
      expect(user.name).to eq 'testuser'
    end
  end

  describe '#create' do
    it 'adds new user' do
      olya = User.create(username: 'olya1203', email: 'olyaolya@mail.com', name: 'OK', password: 'leofelix')
      expect(olya).to be_a User
    end

    it '#doesnt create user if username or email already exists' do
      durov = User.create(username: 'durov', email: 'durov@telegram.com', name: 'Pavel Durov', password: '1122')
      expect(durov).to eq nil 
    end
  end
end
