require 'peep_repository'

def reset_peeps_table
    seed_sql = File.read('spec/seeds/seeds_peeps.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_network_test' })
    connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
    
    before(:each) do 
        reset_peeps_table
    end

    it "returns full list of peeps" do
        repo = PeepRepository.new
        peeps = repo.all

        expect(peeps.length).to eq(5)

        expect(peeps[0].id).to eq(1)
        expect(peeps[0].message).to eq('Today will be a good day')
        expect(peeps[0].time).to eq('09:15:00')
        expect(peeps[0].account_id).to eq(1)
    end

    context "it finds peeps with specific account_id" do
        it "returns the peeps where account_id = 1" do
            repo = PeepRepository.new
            peeps = repo.find(1)

            # expect(peeps[0].id).to eq(1)
            # expect(peeps[0].message).to eq('Today will be a good day')
            # expect(peeps[0].time).to eq('09:15:00')
            # expect(peeps[0].account_id).to eq(1)

            # expect(peeps[1].id).to eq(4)
            # expect(peeps[1].message).to eq('Twisted my ankle today :(')
            # expect(peeps[1].time).to eq('18:45:00')
            # expect(peeps[1].account_id).to eq(1)
        end

        it "returns the peeps where account_id = 2" do
            repo = PeepRepository.new
            peeps = repo.find(2)

            expect(peeps[0].id).to eq(3)
            expect(peeps[0].message).to eq('Arsenal playing, buzzing!')
            expect(peeps[0].time).to eq('15:10:00')
            expect(peeps[0].account_id).to eq(2)

            expect(peeps[1].id).to eq(5)
            expect(peeps[1].message).to eq('Good win!')
            expect(peeps[1].time).to eq('22:00:00')
            expect(peeps[1].account_id).to eq(2)
        end

        it "returns the peep where account_id = 3" do
            repo = PeepRepository.new
            peeps = repo.find(3)

            expect(peeps[0].id).to eq(2)
            expect(peeps[0].message).to eq('I am bored who is out?')
            expect(peeps[0].time).to eq('11:30:00')
            expect(peeps[0].account_id).to eq(3)
        end
    end

    it "creates new peep" do
        repo = PeepRepository.new
        
        peep = Peep.new
        peep.message = "Just testing"
        peep.time = '20:00:00'
        peep.account_id = 3

        repo.create(peep)

        expect(repo.all).to include (
            have_attributes(
                message: 'Just testing',
                time: '20:00:00',
                account_id: 3
            )
        )
    end

    it "deletes peep by id" do
        repo = PeepRepository.new
        repo.delete(1)

        expect(repo.all).not_to include(
            have_attributes(
                message: "Today will be a good day",
                time: '09:15:00',
                account_id: 1
            )
        )
    end
end