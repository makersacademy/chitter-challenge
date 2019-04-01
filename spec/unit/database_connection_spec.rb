# TO DO: pending mocking for USER and PEEP

require './lib/database_connection'
require './helpers/database_helpers'

describe DatabaseConnection do

  describe '.setup' do
    it 'connects to a database and retruns a connection object'do
      expect(DatabaseConnection.setup('chitter_test')).to be_a PG::Connection
    end
  end

  describe '.query' do
    it 'adds a user to the database' do
      user = User.create(name: 'My_name', username: 'My_username', email: 'someemail@gmail.com', password: 'fefwefwe')
      result = persisted_data(id_type: 'id', id_value: user.id, table: 'users')
      expect(result['username']).to eq user.username
    end

    it 'adds a peep to the database' do
      user = User.create(name: 'My_name', username: 'My_username', email: 'someemail@gmail.com', password: 'fefwefwe')
      peep = Peep.create(user_id: user.id , peep: 'Some peep')
      result = persisted_data(id_type: 'user_id', id_value: user.id, table: 'peeps')
      expect(peep.peep).to eq result['peep']

    end

  end

end