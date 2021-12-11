require 'database_connection'

describe DatabaseConnection do

  it 'connects to the database' do
    expect(PG).to receive(:connect).with(dbname: 'chitter_test')
    DatabaseConnection.setup(dbname: 'chitter_test')
  end

  it 'creates a persistent connection to the datbase' do
    res = DatabaseConnection.setup(dbname: 'chitter_test')
    expect(DatabaseConnection.connect).to eq res
  end

  it 'executes an sql query' do
    res = DatabaseConnection.connect
    expect(res).to receive(:exec_params).with("SELECT * FROM peeps;", [])
    DatabaseConnection.query("SELECT * FROM peeps;")
  end
end
