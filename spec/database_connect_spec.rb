require 'database_connect'

describe DatabaseConnection do

  it 'returns the attr reader for' do 
    expect(DatabaseConnection).to respond_to(:current_connection)
  end

  it 'returns a pg instance' do
    expect(DatabaseConnection.setup).to be_a(PG::Connection)
  end

  it 'sets up a connection to a databsae through PG' do 
    expect(PG).to receive(:connect).with(dbname: 'chitter_test')
    DatabaseConnection.setup
  end 

  it 'executes a query via PG' do 
    connection = DatabaseConnection.setup
    expect(connection).to receive(:exec).with("SELECT * FROM peeps")
    DatabaseConnection.query("SELECT * FROM peeps")
  end 
end