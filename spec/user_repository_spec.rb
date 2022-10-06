require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('schema/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end
end


# it 'finds all artists' do
#   repo = ArtistRepository.new

#   artists = repo.all
  
#   expect(artists.length).to eq(4)
#   expect(artists.first.name).to eq('Pixies')
# end

# it 'finds one artist' do
#   repo = ArtistRepository.new

#   artist = repo.find(3)
  
#   expect(artist.id).to eq(3)
#   expect(artist.name).to eq('Taylor Swift')
# end

# it 'creates an album' do
#   repo = ArtistRepository.new

#   artist = Artist.new
#   artist.name = 'Kiasmos'
#   artist.genre = 'Experimental'
#   repo.create(artist)

#   artists = repo.all

#   expect(artists.length).to eq(5)
#   expect(artists.last.name).to eq('Kiasmos')
# end
# end