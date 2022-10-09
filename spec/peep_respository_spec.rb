require 'peep_repository.rb'
require 'peep.rb'
require 'database_connection'
  
RSpec.describe PeepRepository do
    # def reset_peeps_tables
    #     seed_sql = File.read('spec/seeds_peepingusers.sql')
    #     connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    #     connection.exec(seed_sql)
    # end
    # before(:each) do 
    #   reset_peeps_tables
    # end
  # previous issue with returning all users
    it 'returns all peeps' do
        repo = PeepRepository.new

        peeps = repo.all
        expect(peeps.first.content).to eq 'Selling 2 tickets for Glastonbury.'
        expect(peeps.first.date).to eq '2022-06-01 08:00:00'
        expect(peeps.first.id).to eq '1'
        expect(peeps.length).to eq 3
 
        # expect(peeps[1].content).to eq "Sold. Please DM me immediately."
        # expect(peeps[1].date).to eq "2022-06-01 08:01:00" 
        # expect(peeps[1].user_id).to eq "2"
        
    end
    
    # only test thats functional
    xit 'returns a fresh peep' do
        repo = PeepRepository.new
        peep = Peep.new

        peep.content = "Anyone got Glastonbury tickets??"
        peep.date = '2022-01-01 12:00:00'
        peep.id = '1'
        repo.add(peep)

        expect(repo.all.length).to eq 4
        expect(repo.all[-1].content).to eq 'Not that'
    
    end
    #previous issue with deletions
    # xit 'deletion of peeps' do
    #     repo = PostRepository.new

    #     delete_peep = 1
    #     repo.delete(delete_peep)
    #     expect(all_peeps.length).to eq 1
    #     expect(all_peeps.first.id).to eq "2"
    # end
end