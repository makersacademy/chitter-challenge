describe User do
  let(:name) { 'User 1'}
  let(:user) { User.new(name: name) }

  describe '#new' do
    it 'should initialize an instance of a User object' do
      expect(user).to be_a User
      expect(user.name).to eq name
    end
  end

  describe '.create' do
    it 'should insert a user into users table and return an instance of a User' do
      result = User.create(name: name)
      persisted_data = user_persisted_data_retrieve(result['id'])

      expect(result).to be_a User
      expect(result.id).to eq eq persisted_data['id']
      expect(result.name).to name
    end
  end

  describe '.db_connection' do
    it 'should establish an environment appropriate connection to the chitter database' do
      result = User.db_connection

      expect(result).to be_a PG::Connection
    end
  end
end
