require 'user'

describe User do
  describe '.create' do
    it 'creates and stores a user in the database' do
      user = User.create(
        name: 'Marius',
        username: 'mbrad26',
        email: 'marius2020@gmail.com',
        password: 'apassword'
      )
      persisted_data = PG.connect(dbname: 'chitter-test')
                         .exec("SELECT * FROM users WHERE id = '#{user.id}';")

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'Marius'
      expect(user.username).to eq 'mbrad26'
      expect(user.email).to eq 'marius2020@gmail.com'
    end
  end
end
