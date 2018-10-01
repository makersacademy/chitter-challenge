require 'chitter'
require 'timecop'

describe Message do
  describe '#add' do
    it 'has a add method' do
      expect(Message).to respond_to(:add)
    end

    it 'adds a post in the database' do
      PG.connect(dbname: 'chitter_db_test')
      Message.add("Hello")
      expect(Message.show).to include "Hello"
    end
  end

  it 'has a show method' do
    expect(Message).to respond_to(:show)
  end

  it 'shows the data in the database' do
    connection = PG.connect(dbname: 'chitter_db_test')
    connection.exec("INSERT INTO posts (message) VALUES ('First message');")
    connection.exec("INSERT INTO posts (message) VALUES ('Second message');")
    expect(Message.show).to include "First message"
    expect(Message.show).to include "Second message"
  end

  it 'shows the time that the app was posted' do
    connection = PG.connect(dbname: 'chitter_db_test')
    connection.exec("INSERT INTO posts (message) VALUES ('First message');")
    expect(Message.time).to be_kind_of(Date)
  end

end
