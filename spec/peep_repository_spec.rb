require 'peep'
require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('schema/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  describe '#all' do
    it 'finds first peep' do
      repo = PeepRepository.new
      peeps = repo.all

      expect(peeps.length).to eq 10 

      expect(peeps.first.id).to eq 1
      expect(peeps.first.content).to eq 'First peep babeh!'
      expect(peeps.first.time).to eq '2009-01-17 12:23:00'
      expect(peeps.first.user_id).to eq 3
    end

    it 'checks multiple records exist' do
      repo = PeepRepository.new

      peeps = repo.all

      expect(peeps.length).to eq 10
      expect(peeps[4].id).to eq 5
      expect(peeps[4].content).to eq '@tesco, I want a refund #nowplease'
      expect(peeps[4].time).to eq '2022-10-06 14:01:00'
      expect(peeps[4].user_id).to eq 6
    end
  end

  describe '#create' do
    it 'creates a new peep record' do
      repo = PeepRepository.new
      peep = Peep.new
      peep.content = 'Testing 123'
      peep.time = (Time.now).strftime("%F %T")
      peep.user_id = 1

      repo.create(peep) # =>

      all_peeps = repo.all
      last_peep = all_peeps.last
      expect(last_peep.content).to eq 'Testing 123'
      expect(last_peep.time).to eq (Time.now).strftime("%F %T")
      expect(last_peep.user_id).to eq 1
    end
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