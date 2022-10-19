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
    it 'finds all peeps in reverse order' do
      repo = PeepRepository.new
      all_peeps = repo.all

      expect(all_peeps.length).to eq(3)
      expect(all_peeps.last.id).to eq(1)
      expect(all_peeps.last.content).to eq('Have you seen my new kitty-cat? She is adorable!')
      expect(all_peeps.last.maker_id).to eq(1)
    end
  end

  describe '#find' do
    it 'finds a peep with its id' do
      repo = PeepRepository.new
      peep = repo.find(2)

      expect(peep.content).to eq('I am back from the dead and stronger than ever.')
      expect(peep.maker_id).to eq(2)
    end  
    
    it 'finds a peep with its id when id is 3' do
      repo = PeepRepository.new
      peep = repo.find(3)

      expect(peep.content).to eq('Who thought foxes could be so fascinating? Have you seen the documentary...')
      expect(peep.maker_id).to eq(2)
    end 
  end

  describe "#create" do
    it 'creates a peep' do
      repo = PeepRepository.new
      new_peep = Peep.new

      new_peep.content = 'Let me tell you a funny story, once I went into a pub and...'
      new_peep.maker_id = 1
      repo.create(new_peep)

      peeps = repo.all

      expect(peeps.length).to eq(4)
      expect(peeps.first.content).to eq('Let me tell you a funny story, once I went into a pub and...')
      expect(peeps.first.maker_id).to eq(1)
    end
  end
end