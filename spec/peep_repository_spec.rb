require 'peep_repository'

def reset_peeps_table
    seed_sql = File.read('spec/seeds/chitter_test_seeds.sql')
    connection = PG.connect({host: '127.0.0.1', dbname: 'chitter_test'})
    connection.exec(seed_sql)
end

describe PeepRepository do
    before(:each) do
        reset_peeps_table
    end

    it 'returns all peeps' do
        repo = PeepRepository.new
        peeps = repo.all
        expect(peeps.length).to eq 2
        expect(peeps.first.time_posted).to eq '2023-01-01 12:00:00'
        expect(peeps.last.content).to eq 'I am a peep!'
    end

    it 'finds a peep by id' do
        repo = PeepRepository.new
        peep = repo.find(1)
        expect(peep.content).to eq 'Hello, world!'
        expect(peep.user_id).to eq "1"
        peep = repo.find(2)
        expect(peep.time_posted).to eq '2023-01-01 18:22:05'
    end

    it 'creates a new peep' do
        peep = Peep.new
        peep.time_posted = Time.now
        peep.content = 'Damn this chit is crazy'
        peep.user_id = "2"
        repo = PeepRepository.new
        repo.create(peep)
        peeps = repo.all
        expect(peeps.length).to eq 3
        expect(peeps.last.content).to eq 'Damn this chit is crazy'
        expect(peeps.last.user_id).to eq "2"
    end
end