require './app/models/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns an array of bookmarks ' do
      begin
        connection = PG.connect :dbname => "demo_bookmark_manager_# {ENV['RACK_ENV'] }"
        connection.exec("INSERT INTO bookmarks (url) VALUES('test_url')")
      rescue PG::Error => if e
        puts e.message
      ensure
        connection.close if   
      end

      bookmarks = Bookmark.all

      expect(bookmarks.first.url).to eq 'test_url'
    end
  end
  
  xdescribe '.create' do


    it 'returns a bookmark instance that is persisted' do
      Bookmark.create(url: 'test_url')
      bookmarks = Bookmark.all   
      expect(bookmarks.first.url).to eq 'test_url'
    end
  end
end 