require 'peep'
require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test'})
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_peeps_table
  end
  
  describe '#all' do
    it 'finds all peeps' do
      repo = PeepRepository.new
      all_peeps = repo.all

      expect(all_peeps.length).to eq(3)
      expect(all_peeps.first.id).to eq(1)
      expect(all_peeps.first.content).to eq('Have you seen my new kitty-cat? She is adorable!')
      expect(all_peeps.first.created_at).to eq('2022-10-05 17:50:20')
      expect(all_peeps.first.user_id).to eq(1)
    end
  end

  describe '#find' do
    it 'finds a peep with its id' do
      repo = PeepRepository.new
      peep = repo.find(2)

      expect(peep.content).to eq('I am back from the dead and stronger than ever.')
      expect(peep.user_id).to eq(2)
      expect(peep.created_at).to eq('2022-10-03 12:45:20')
    end    
  end
end