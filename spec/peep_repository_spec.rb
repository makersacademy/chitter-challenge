require 'peep_repository'
require 'database_connection'

def reset_peeps_table
  seed_sql = File.read('spec/peep_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  context 'chitter database contains populated peeps table' do
    it 'gets all peeps' do
      repo = PeepRepository.new
      peeps = repo.all
      expect(peeps.length).to eq 2
      expect(peeps[0].message).to eq 'Nice weather this morning!'
      expect(peeps[0].tag).to eq 'Miles'
      expect(peeps[0].created_at).to eq '2004-10-19 10:30:00'
    end
  
    it 'finds a peep' do
      repo = PeepRepository.new
      peep = repo.find(2)
      expect(peep.message).to eq 'Love this song!'
      expect(peep.tag).to eq 'Miles'
      expect(peep.created_at).to eq '2001-01-14 08:45:00'
    end

    it 'creates a new peep' do
      repo = PeepRepository.new
      new_peep = Peep.new
      new_peep.message = 'Hello, world!'
      new_peep.tag = ''
      new_peep.created_at = '2022-01-01 12:00'
      repo.create(new_peep)

      peeps = repo.all
      last_peep = peeps.last
      expect(last_peep.message).to eq 'Hello, world!'
      expect(last_peep.tag).to eq ''
      expect(last_peep.created_at).to eq '2022-01-01 12:00:00'
    end
  end
end