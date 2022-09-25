require 'peep'
require 'peep_repository'

def reset_table
    seed_sql = File.read('spec/seeds/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
    connection.exec(seed_sql)
  end
  
  describe PeepRepository do
    before(:each) do 
      reset_table
    end

    let(:repo) {PeepRepository.new}

    it 'lists all peeps' do
        result = repo.all
        expect(result.first.name).to eq 'Moses'
        expect(result.first.username).to eq 'Mosho'
        expect(result.first.content).to eq 'My first peep!'
        expect(result.first.time).to eq '2022-09-20 15:03:45'

        expect(result.last.name).to eq 'Moses'
        expect(result.last.username).to eq 'Mosho'
        expect(result.last.content).to eq 'My second! peep!'
        expect(result.last.time).to eq '2022-09-20 16:03:45'
    end

    it 'finds a peep' do
        result = repo.find(2)
        expect(result.name).to eq 'Layi'
        expect(result.username).to eq 'Layi88'
        expect(result.content).to eq 'Test peep 2'
        expect(result.time).to eq '2022-09-20 16:00:00'
    end

    it 'creates a peep' do
        peep = Peep.new
        peep.name = 'Test'
        peep.username = 'Test247'
        peep.content = 'test content'
        peep.time = '2022-09-20 17:03:45'

        repo.create(peep)

        result = repo.find(4)
        expect(result.name).to eq 'Test'
        expect(result.username).to eq 'Test247'
        expect(result.content).to eq 'test content'
        expect(result.time).to eq '2022-09-20 17:03:45'

    end
    
end