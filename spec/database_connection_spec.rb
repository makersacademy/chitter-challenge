require 'database_connection'
require 'pg'

describe DatabaseConnection do

  let(:dbname) { 'chitter_test' }

  it 'messages PG to open a connection' do
    expect(PG).to receive(:connect).with(dbname: dbname)
    DatabaseConnection.setup(dbname)
  end

  it 'has a persistent connection' do
    con = DatabaseConnection.setup(dbname)
    expect(DatabaseConnection.connection).to eq con
  end

  it 'messages PG to execute a query' do
    con = DatabaseConnection.setup(dbname)
    expect(con).to receive(:exec).with(any_args)
    DatabaseConnection.query('SELECT * FROM links')
  end
end
