require './lib/chitter_user.rb'

describe ChitterUser do
  describe '#add' do
    it 'adds a user to the database' do
        drop_test_database
        user = ChitterUser.add(email:'test@testhere.com', username: 'Test1',
          name: 'Test One', password: 'Password123')
        expect(user.username).to eq 'Test1'
    end
  end
end

# Bookmark.add(title: 'BBC', url: 'www.bbc.co.uk')
# Bookmark.add(title: 'BBC', url: 'www.bbc.co.uk')
#   con = PG.connect dbname: 'bookmark_manager_test'
#   result = con.exec "SELECT * FROM bookmarks where url = 'www.bbc.co.uk'"
#   expect(result.values[0][1]).to eq('www.bbc.co.uk')
#   expect(result.values[0][2]).to eq('BBC')
