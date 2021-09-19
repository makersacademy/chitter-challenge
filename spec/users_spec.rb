require 'users'
describe User do

  context 'I want to sign up for Chitter' do

    it 'inits user' do
      user = User.new(id: 1, username: 'username', email: 'username@gmail.com')
      expect(user.id).to eq 1
      expect(user.username).to eq 'username'
      expect(user.email).to eq 'username@gmail.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('YOU2WILL_NEV3RGETD1Spassword123')
      User.add(username: 'encrypted', email: 'encrypted@example.com', password: 'password123')
    end

    it 'when authenticated' do
      user = User.add(username: 'login', email: 'test@example.com', password: 'password123')
      auth = User.auth(email: 'test@example.com', password: 'password123')
      expect(user.id).to eq auth.id
    end

  end

end