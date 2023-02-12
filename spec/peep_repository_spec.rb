require 'pg'
require 'peep_repository'
require 'peep'

def reset_peeps_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter'})
    connection.exec(seed_sql)
end

RSpec.describe PeepRepository do

    before (:each) do
        reset_peeps_table
    end

    it 'returns all peeps' do
        peep_repo = PeepRepository.new
        allpeeps = peep_repo.all

        expect(allpeeps.length).to eq 6
        expect(allpeeps.first.contents).to eq "Test peep 1 contents as a string"
    end

    it 'returns information on the third peep' do
        peep_repo = PeepRepository.new
        peep3 = peep_repo.find(3)

        expect(peep3.contents).to eq "Test peep 3 contents. In two sentences."
        expect(peep3.user_id).to eq 1
    end

    it 'creates an peep' do
        repo = PeepRepository.new
    
        new_peep = Peep.new
        new_peep.contents = 'My laptop decided to spend four hours updating today which is why I am committing this so late'
        new_peep.timestamp = '23:59'
        new_peep.user_id = 3
        repo.create(new_peep)
    
        allpeeps = repo.all
    
        expect(allpeeps.length).to eq(7)
        expect(allpeeps.last.contents).to eq('My laptop decided to spend four hours updating today which is why I am committing this so late')
        expect(allpeeps.last.user_id).to eq 3
      end

end