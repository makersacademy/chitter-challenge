require 'user'

describe User do
  describe '#create' do
    it 'adds a new user to the database' do
      name = 'Bob Geldof'
      username = 'begeldof'
      email = 'its.me@bobgeldof.com'
      password = 'bob'

      user = described_class.create(name: name, username: username, email: email, password: password)

      connection = PG.connect dbname: 'chitter_manager_test'
      result = connection.exec("SELECT * FROM users WHERE id = #{user.id};").first

      expect(user).to be_a described_class
      expect(user.id).to eq result['id']
      expect(user.name).to eq result['name']
      expect(user.username).to eq result['username']
      expect(user.email).to eq result['email']
    end
  end
end
