require 'peep_repository'

def reset_peeps_table
    seed_sql = File.read('spec/seeds/chitter_test_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end
    
describe PeepRepository do
    before(:each) do 
        reset_peeps_table
    end

    it 'gets all peeps' do
        repo = PeepRepository.new
        peeps = repo.all
        expect(peeps.length).to eq 2
        expect(peeps.first.time_posted.strftime("%Y-%m-%d %H:%M:%S")).to eq '2023-01-13 14:22:06'
        expect(peeps.last.content).to eq 'Going surfing tomoz, who wants to join, hit me up!'
    end

    it 'find one peep by id' do
        repo = PeepRepository.new
        peep = repo.find(1)
        expect(peep.content).to eq 'First peep on this chit!!!'
        expect(peep.user_id).to eq 1
        peep = repo.find(2)
        expect(peep.time_posted.strftime("%Y-%m-%d %H:%M:%S")).to eq '2023-01-13 15:05:23'
    end

    it 'creates a peep' do
        peep = Peep.new
        peep.time_posted = Time.now
        peep.content = 'I WILL TAKE OVER THE WORLD! MWAHAHAHAHA!!!'
        peep.user_id = 2
        repo = PeepRepository.new
        repo.create(peep)
        peeps = repo.all
        expect(peeps.length).to eq 3
        expect(peeps.last.content).to eq 'I WILL TAKE OVER THE WORLD! MWAHAHAHAHA!!!'
        expect(peeps.last.user_id).to eq 2
    end
end