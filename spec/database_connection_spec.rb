require 'database_connection'

describe DatabaseConnection do

  it 'connects to the database' do
    expect(PG).to receive(:connect).with(dbname: 'chitter')
    DatabaseConnection.connect
  end

  it 'executes an sql query' do
    res = DatabaseConnection.connect
    expect(res).to receive(:exec_params).with("SELECT * FROM peeps;", [])
    DatabaseConnection.query("SELECT * FROM peeps;")
  end

end