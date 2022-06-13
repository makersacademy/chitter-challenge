require 'peep'

#testing just the ruby and SQL link

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      # connect to the test db
      connection = PG.connect(dbname: 'chitter_test')
  
      # Add the test data
      connection.exec("INSERT INTO peeps (user_id, content) VALUES (0000001, 'lol, this is my first peep!');")
  
  
      bookmarks = Bookmark.all #Bookmark.all is specifically editing the 'bookmarks' table from either the test of real db
  
        expect(bookmarks).to include('lol, this is my first peep!')
    end
  end