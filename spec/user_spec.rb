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
      expect(user.password).to eq 'password'
    end
  end
end
