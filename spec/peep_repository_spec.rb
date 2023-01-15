require_relative '../lib/peep_repository'
require_relative '../lib/peep'

RSpec.describe PeepRepository do 

    def reset_users_peeps_table
        seed_sql = File.read('spec/seeds_users_peeps.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
        connection.exec(seed_sql)
      end
      
     
    before(:each) do 
        reset_users_peeps_table
    end

    after(:each) do
        reset_users_peeps_table
    end
      
    it 'lists all peeps ' do 
        repo = PeepRepository.new

        peeps = repo.all
        
        expect(peeps.length).to eq 4
        
        expect(peeps[0].id).to eq('1')
        expect(peeps[0].message).to eq('It is raining today')
        expect(peeps[0].date).to eq('2022-08-08')
        expect(peeps[0].user_id).to eq('1')
        
        expect(peeps[1].id).to eq('2')
        expect(peeps[1].message).to eq('Tonight we are going to take yoga classes')
        expect(peeps[1].date).to eq('2022-11-18')
        expect(peeps[1].user_id).to eq('2')
    end 

    it 'adds a peep ' do
        repo = PeepRepository.new

        new_peep = Peep.new

        new_peep.message = 'Lovely day today'
        new_peep.date = '2023-01-12'
        new_peep.user_id = '4'

        repo.add(new_peep)
        peeps = repo.all

        expect(peeps.last.message).to eq('Lovely day today')
        expect(peeps.last.date).to eq('2023-01-12')
        expect(peeps.last.user_id).to eq('4')
    end

end