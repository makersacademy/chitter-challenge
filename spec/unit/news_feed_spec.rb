require 'news_feed'

describe NewsFeed do
  before(:each) do
    @connection = PG.connect(dbname: 'chitter_test')
    @connection.exec('TRUNCATE TABLE news_feed;')
  end

  it 'sends a peep to the database' do
    message = NewsFeed.create(name: 'John', message: 'Hello World', time: "#{Time.new}")

    message = NewsFeed.all

    expect(message[0]['message']).to include('Hello World')
  end
end
