require './lib/database_connection'
require 'pg'

describe DatabaseConnection do

  it 'sets up a database connection' do
    expect(PG).to receive(:connect).with(dbname: 'chitter_test')
    DatabaseConnection.setup('chitter_test')
  end

  it 'maintains a persisten connection' do
    connection = DatabaseConnection.setup('chitter_test')
    expect(DatabaseConnection.connection).to eq connection
  end

  it 'queries a database' do
    connection = DatabaseConnection.setup('chitter_test')
    expect(connection).to receive(:exec).with("select * from peeps;")
    DatabaseConnection.query("select * from peeps;")
  end
end
