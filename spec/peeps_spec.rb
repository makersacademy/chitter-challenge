require 'peep.rb'

truncate_database

describe '.all' do
  it 'returns a list peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO chitter (title) VALUES ('Hello!');")
  
    bookmarks = Bookmark.all
  
    expect(chitters).to include('Hello!')
  end
end