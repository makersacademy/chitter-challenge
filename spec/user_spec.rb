require 'user'

describe User do
  let(:name) { 'Bob Geldof' }
  let(:username) { 'begeldof' }
  let(:email) { 'its.me@bobgeldof.com' }
  let(:password) { 'bob123' }
  let!(:user) {
    described_class.create(
      name: name,
      username: username,
      email: email,
      password: password
    )
  }

  describe '#create' do
    it 'creates a user instance' do
      expect(user).to be_a described_class
      expect(user.id.to_i).to be_a Integer
      expect(user.name).to eq name
      expect(user.username).to eq username
      expect(user.email).to eq email
    end

    it 'adds a new user to the database' do
      sql = "SELECT * FROM users WHERE id = #{user.id};"
      result = DatabaseConnection.execute(sql).first

      expect(user).to be_a described_class
      expect(user.id).to eq result['id']
      expect(user.name).to eq result['name']
      expect(user.username).to eq result['username']
      expect(user.email).to eq result['email']
    end

    it 'hashes the password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with(password)
      described_class.create(
        name: name,
        username: username,
        email: email,
        password: password
      )
    end
  end

  describe '#find' do
    it 'returns a user based on id' do
      result = described_class.find(user.id)

      expect(result.id).to eq user.id
      expect(result.name).to eq name
      expect(result.username).to eq username
      expect(result.email).to eq email
    end
  end
end
