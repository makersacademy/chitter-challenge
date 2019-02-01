require 'database_connection'

describe DatabaseConnection do

  it 'Can set up a new database connection' do
    expect(PG).to receive(:connect).with(dbname: 'chitter_challenge_test')
    DatabaseConnection.setup('chitter_challenge_test')
  end

  it 'Can return the database connection' do
    test_connection = DatabaseConnection.setup('chitter_challenge_test')
    expect(DatabaseConnection.connection).to eq test_connection
  end

  it 'Can pass an sql query to a database connection' do
    test_connection = DatabaseConnection.setup('chitter_challenge_test')
    expect(test_connection).to receive(:exec).with('Test query')
    DatabaseConnection.query('Test query')
  end
end
