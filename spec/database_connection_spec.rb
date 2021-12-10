require 'database_connection'

describe DatabaseConnection do
  context '.setup'
  it 'setup the connection to the database' do
    expect(PG).to receive(:connect).with(dbname: 'chitter_test')
    DatabaseConnection.setup('chitter_test')
  end
  
  context '.connection'
  it "should have a persistent connection" do
    test_connection = DatabaseConnection.setup('chitter_test')
    expect(DatabaseConnection.connection).to eq test_connection
  end

  context '.query'
  it 'execute the sql query' do
    result = DatabaseConnection.setup('chitter_test')
    expect(result).to receive(:exec_params).with("SELECT * FROM messages;", [])
    DatabaseConnection.query("SELECT * FROM messages;")
  end
end
