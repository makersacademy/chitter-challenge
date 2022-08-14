require 'peep_repository'
require 'peep'

def reset_peeps_table
  seed_sql = File.read('spec/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
  connection.exec(seed_sql)
end
  
describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end
end

  context 'all' do
    it 'shows all peeps in chronological order' do
      repo = PeepRepository.new
      peeps = repo.all

      expect(peeps.length).to eq(2)
      expect(peeps.first.timestamp).to eq('2022-08-13 13:00:00')
      expect(peeps.first.name).to eq('Zeus')

      expect(peeps.last.timestamp).to eq('2022-08-13 12:00:00')
      expect(peeps.last.name).to eq('Alex')
    end
  end




  context 'create' do
    xit 'creates new peep and shows it at the top of the feed' do

    repo = PeepRepository.new
    new_peep = Peep.new

    new_peep.content = 'Send help. Melting.'
    new_peep.timestamp = '2022-13-08 14:00:00'
    new_peep.name = 'Fleur'
    new_peep.username = 'itsfleurduh'

    repo.create(new_peep)

    peeps = repo.all
    newest_peep = peeps.first

    expect(newest_peep.content).to eq 'Send help. Melting.'
    expect(newest_peep.timestamp).to eq '2022-13-08 14:00:00'
    expect(newest_peep.name).to eq 'Fleur'
    expect(newest_peep.username).to eq 'itsfleurduh'
    end
  end