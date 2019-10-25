describe '.content' do
  it 'returns the chitter feed content' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO feed (content) VALUES ('This is message by Luke');")
    connection.exec("INSERT INTO feed (content) VALUES ('This is another message by Steve');")
    connection.exec("INSERT INTO feed (content) VALUES ('This is the Chitter Challenge');")

    feed = ChitterFeed.content

    expect(feed).to include('This is message by Luke')
    expect(feed).to include('This is another message by Steve')
    expect(feed).to include('This is the Chitter Challenge')
  end
end
