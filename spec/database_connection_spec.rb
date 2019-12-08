describe '.query' do
  it 'executes a query via PG' do
    connection = DatabaseConnection.setup('chitter_test')

    expect(connection).to receive(:exec).with("SELECT * FROM users;")

    DatabaseConnection.query("SELECT * FROM users;")
  end
end