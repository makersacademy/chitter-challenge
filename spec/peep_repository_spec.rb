require './lib/peep.rb'
require './lib/peep_repository.rb'

def reset_peeps_table
    seed_sql = File.read('spec/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end

describe PeepRepository do
    before(:each) do 
        reset_peeps_table
    end

    it "returns all peeps" do
        repo = PeepRepository.new

        peeps = repo.all
       
        expect(peeps.length).to eq 5
        expect(peeps.first.message).to eq("message1")
        expect(peeps.first.time_stamp).to eq('2022-06-08 12:00:00')
        expect(peeps.first.user_id).to eq("1")
    end
       
    it "creates a peep" do
        repository = PeepRepository.new
        peep = Peep.new
        peep.message = 'message6'
        peep.time_stamp = '2022-03-08 12:00:00'
        peep.user_id = "2"

        repository.create(peep)

        all_peeps = repository.all
        last_peep = all_peeps.last
        expect(last_peep.message ).to eq('message6')
        expect(last_peep.time_stamp).to eq('2022-03-08 12:00:00')
        expect(last_peep.user_id).to eq("2")
    end


end