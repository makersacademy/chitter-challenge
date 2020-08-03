describe DatabaseConnection do
  it 'does a connection' do
    connection = PG.connect(dbname: 'chitter_test')
    expect(DatabaseConnection.connection).to eq(connection)
  end

  it 'can access the data base' do
    Message.create(user_id: 1, content: "A test, again")
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT content FROM messages;")
    expect(DatabaseConnection.query("SELECT content FROM messages;")).to eq(result)
  end
end
