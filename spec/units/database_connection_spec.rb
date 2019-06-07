require 'database_connection'

describe DatabaseConnection do
  # before(:each) { truncates }
  # before(:each) { add_bookmarks }

  it 'can return a PG instance' do
    expect(DatabaseConnection.setup).to be_a(PG::Connection)
  end

  it 'connects to the test database through PG' do 
    expect(PG).to receive(:connect).with(dbname: 'chitter_test')
    DatabaseConnection.setup
  end 

  it 'can execute a psql query via PG' do 
    connection = DatabaseConnection.setup
    expect(connection).to receive(:exec).with("SELECT * FROM peeps")
    DatabaseConnection.query("SELECT * FROM peeps")
  end 
end