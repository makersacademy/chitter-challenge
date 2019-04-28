require 'user'

describe User do
  describe '#create' do
    it 'creates a user instance' do
      name = 'Bob Geldof'
      username = 'begeldof'
      email = 'its.me@bobgeldof.com'
      password = 'bob'

      user = described_class.create(name: name, username: username, email: email, password: password)

      expect(user).to be_a described_class
      expect(user.id.to_i).to be_a Integer
      expect(user.name).to eq name
      expect(user.username).to eq username
      expect(user.email).to eq email
    end

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

  describe '#find' do
    it 'returns a user based on id' do
      name = 'Bob Geldof'
      username = 'begeldof'
      email = 'its.me@bobgeldof.com'
      password = 'bob'

      user = described_class.create(name: name, username: username, email: email, password: password)
      result = described_class.find(user.id)

      expect(result.id).to eq user.id
      expect(result.name).to eq name
      expect(result.username).to eq username
      expect(result.email).to eq email
    end
  end
end
