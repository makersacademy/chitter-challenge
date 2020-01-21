require 'database_connection'

describe 'DatabaseConnection' do
  it 'sets up connection to a database through PG' do
    expect(DatabaseConnection.setup('chitter_test')).to be_instance_of PG::Connection
  end

  it 'executes a query via PG' do
    connection = DatabaseConnection.setup('chitter_test')
    expect(connection).to receive(:exec).with("SELECT * FROM chitter_test;")
    DatabaseConnection.query("SELECT * FROM chitter_test;")
  end
end
