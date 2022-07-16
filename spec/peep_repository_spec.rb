require 'peep'
require 'peep_repository'

def reset_peeps_table
    seed_sql = File.read('spec/seeds/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
    connection.exec(seed_sql)
end
  
describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  context 'view peeps' do 
    it 'view all peeps' do 
        repo = PeepRepository.new
        peeps = repo.all
        expect(peeps.length).to eq 3
        expect(peeps.first.content).to eq "content1"
    end

    it 'find peeps with user_id' do
        repo = PeepRepository.new
        peeps = repo.find("1")
        expect(peeps.length).to eq 2
    end
  end

  context 'Create peeps' do
    it 'create a new peep' do
      repo = PeepRepository.new

      new_peep = Peep.new
      new_peep.content = 'Lovely hot day'
      new_peep.date = '2022-07-16 08:15:15'
      new_peep.user_id = '3'
      repo.create(new_peep)

      peeps = repo.all

      expect(peeps.length).to eq 4
      expect(peeps.last.id).to eq '4'
      expect(peeps.last.content).to eq 'Lovely hot day'
    end
  end
end