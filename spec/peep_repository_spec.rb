require 'peep'
require 'peep_repository'

def reset_peeps_table
    seed_sql = File.read('spec/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
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
end