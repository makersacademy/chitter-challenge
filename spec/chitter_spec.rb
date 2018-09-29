require 'chitter'

describe Message do
  # describe '#add' do
  #   it 'has a add method' do
  #     expect(Message).to respond_to(:add)
  #   end
  # end

  it 'has a show method' do
    expect(Message).to respond_to(:show)
  end

  it 'shows the data in the database' do
    connection = PG.connect(dbname: 'chitter_db_test')
    connection.exec('TRUNCATE TABLE posts')
    connection.exec("INSERT INTO posts (message) VALUES ('First message');")
    connection.exec("INSERT INTO posts (message) VALUES ('Second message');")
    expect(Message.show).to include "First message"
    expect(Message.show).to include "Second message"
  end
end
