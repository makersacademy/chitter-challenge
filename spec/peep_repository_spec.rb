require 'peep_repository'

RSpec.describe PeepRepository do
  def reset_chitter_tables
    seed_sql = File.read('spec/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_chitter_tables
  end

  context 'The All Method' do
    it 'returns all the peeps' do
      repo = PeepRepository.new
      peeps = repo.all
      
      expect(peeps.length).to eq 4
      expect(peeps.first.content).to eq 'This is the first Peep'
      expect(peeps.first.time).to eq '2023-05-06 12:22:09'
      expect(peeps.first.user_id).to eq '1' 
    end
  end

  context 'The Create Method' do
    it 'creates a new peep and adds it too the database' do
      repo = PeepRepository.new

      peep = Peep.new
      peep.content = 'Jack here with a third peep!'
      peep.time = '2023-05-10 14:56:09'
      peep.user_id = '1'

      repo.create(peep)

      peeps = repo.all
      last_peep = peeps.last

      expect(last_peep.content).to eq 'Jack here with a third peep!'
      expect(last_peep.time).to eq '2023-05-10 14:56:09'
      expect(last_peep.user_id).to eq '1' 
    end
  end

  context 'The Find By Owner Method' do
    it 'returns an array of peeps from the user_id provided' do
      repo = PeepRepository.new
      jack_peeps = repo.find_by_owner(1)

      expect(jack_peeps.length).to eq 2
      expect(jack_peeps.first.content).to eq 'This is the first Peep'
      expect(jack_peeps.first.time).to eq '2023-05-06 12:22:09'
      expect(jack_peeps[1].content).to eq 'This is the second Peep'
    end
  end
end
