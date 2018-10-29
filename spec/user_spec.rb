require './lib/user'

describe User do
  describe '#create' do
    it 'creates a new user' do
      user = User.create(name: 'example', email: 'example@gmail.com', password: 'password')
      persisted_data = PG.connect(dbname: 'chitter_test').exec("SELECT * FROM users WHERE id = #{user.id};")

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'example'
      expect(user.email).to eq 'example@gmail.com'
      expect(user.password).to eq persisted_data.first['user_password']
    end
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(name: 'example', email: 'test@example.com', password: 'password123')
    end
  end
end
