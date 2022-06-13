require 'chitter'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'chitter_test')
    

    # Add the test data
    connection.exec("INSERT INTO chat_log (chat_log) VALUES('Hello');")
    connection.exec("INSERT INTO chat_log (chat_log) VALUES('That is true');")
    connection.exec("INSERT INTO chat_log (chat_log) VALUES('That is false');")

    chitter = Chitter.all

    expect(chitter).to include('Hello')
    expect(chitter).to include('That is true')
    expect(chitter).to include('That is false')
  end
end