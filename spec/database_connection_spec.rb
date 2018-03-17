require 'database_connection'
require 'pg'

describe DatabaseConnection do

  it 'messages PG to open a connection' do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
    DatabaseConnection.setup('bookmark_manager_test')
  end

  it 'has a persistent connection' do
    con = DatabaseConnection.setup('bookmark_manager_test')
    expect(DatabaseConnection.connection).to eq con
  end

  it 'messages PG to execute a query' do
    con = DatabaseConnection.setup('bookmark_manager_test')
    expect(con).to receive(:exec).with(any_args)
    DatabaseConnection.query('SELECT * FROM links')
  end
end
