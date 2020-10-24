require_relative '../../app/models/user'

describe User do
  subject(:user) { described_class.new(id: 1, username: 'testusername', email: 'test@test.com', name: 'testuser', password: 'test') }

  describe '#initialize' do
    it 'has username, email and name' do
      expect(user.username).to eq 'testusername'
      expect(user.email).to eq 'test@test.com'
      expect(user.name).to eq 'testuser'
    end
  end

  describe '#find_by' do
    it 'returns a user instance by id' do
      olya = User.create(username: 'olya1203', email: 'olyaolya@mail.com', name: 'OK', password: 'leofelix')
      result = DatabaseConnection.query("SELECT * FROM users WHERE username='#{olya.username}';")
      user = result.map do |user|
               User.new(
                 id: user['id'],
                 username: user['username'], 
                 email: user['email'], 
                 name: user['full_name'], 
                 password: user['pwd']
               )
             end.first

      found_user = User.find_by(id: user.id)

      expect(found_user.id).to eq user.id
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
