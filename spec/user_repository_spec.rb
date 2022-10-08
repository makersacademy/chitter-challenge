require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('schema/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

RSpec.describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  describe '#all' do
    it 'finds first user' do
      users = repo.all

      expect(users.length).to eq 6

      expect(users.first.id).to eq 1
      expect(users.first.first_name).to eq 'Benedict'
      expect(users.first.last_name).to eq 'Smith'
      expect(users.first.username).to eq 'bennyboy'
      expect(users.first.email).to eq 'ben@gmail.com'
      expect(users.first.password).to eq '123bento'
    end

    it 'checks multiple user records exist' do
      users = repo.all

      expect(users.length).to eq 6

      expect(users[4].id).to eq 5
      expect(users[4].last_name).to eq 'Bloggs'
      expect(users[4].username).to eq 'ragedad'
    end
  end

  describe '#create' do
    it 'creates a new user record' do
      user = User.new
      user.first_name = 'Thierry'
      user.last_name = 'Henry'
      user.username = 'titi14'
      user.email = 'thierry@arsenal.com'
      user.password = 'g0alg0alg0al'

      repo.create(user)

      all_users = repo.all
      last_user = all_users.last
      expect(user.first_name).to eq 'Thierry'
      expect(user.username).to eq 'titi14'
    end
  end

  # describe '#find' do
  #   it 'finds a single user' do
  #     user = repo.find(6)
    
  #     expect(user.id).to eq(6)
  #     expect(user.first_name).to eq('Karen')
  #     expect(user.username).to eq('canispeaktothemanager')
  #   end
  # end

  describe '#find_by_email' do
    it 'finds a single user by email' do
      user = repo.find_by_email('ben@gmail.com')
    
      expect(user.id).to eq(1)
      expect(user.first_name).to eq('Benedict')
      expect(user.username).to eq('bennyboy')
    end
  end

  private

  def repo
    repo = UserRepository.new
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