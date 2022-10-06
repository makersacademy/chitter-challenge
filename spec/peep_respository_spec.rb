require_relative '../lib/peep_repository.rb'
require_relative '../lib/peep.rb'
  
RSpec.describe PeepRepository do
    def reset_chitter_challenge_tables
        seed_sql = File.read('spec/seeds_peeps.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
        connection.exec(seed_sql)
    end
    before(:each) do 
      reset_peeps_tables
    end
  # issue with returning all users
    xit 'returns all peeps' do
        repo = PeepRepository.new

        peeps = repo.all
        expect(peeps.first.content).to eq "Selling 2 tickets for Glastonbury."
        expect(peeps.first.date).to eq "2022-06-01 08:00:00" 
        expect(peeps.first.user_id).to eq "1"
        expect(peeps.length).to eq 3
 
        # expect(peeps[1].content).to eq "Sold. Please DM me immediately."
        # expect(peeps[1].date).to eq "2022-06-01 08:01:00" 
        # expect(peeps[1].user_id).to eq "2"
        
    end
    
    # only test thats functional
    it 'returns a fresh post' do
        repo = PeepRepository.new

        fresh_peep = Peep.new
        fresh_post.content = "Whatup!"
        fresh_post.views = 99
        fresh_post.user_id = 2

        repo.create(fresh_post)

        all_peeps = repo.all

        expect(all_peeps).to include(
            have_attributes(
                title: fresh_post.title,
                content: fresh_post.content,
                views: "99",
                user_id: "2"
            )
        )
    end
    #issue with deletions
    xit 'deletion of peeps' do
        repo = PostRepository.new

        delete_post = 1
        repo.delete(delete_post)
        expect(all_peeps.length).to eq 1
        expect(all_peeps.first.id).to eq "2"
    end
end