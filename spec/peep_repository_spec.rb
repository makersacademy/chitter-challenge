require 'peep'
require 'peep_repository'

def reset_tables
  user_seed_sql = File.read('spec/seeds/seeds_users.sql')
  peep_seed_sql = File.read('spec/seeds/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(user_seed_sql)
  connection.exec(peep_seed_sql)
end

describe PeepRepository do

  before(:each) do 
    reset_tables
  end

   context '#all' do
     peep_order = ['2002-12-04 10:23:54', '2002-12-03 10:06:23', '2002-12-02 12:39:42']
     it 'returns all peeps, sorted chronologically' do 
       repo = PeepRepository.new
       expect(repo.all.count).to eq(3)
       expect(repo.all.map { |peep| peep.created_at }).to eq(peep_order)
     end 
   end 

  context '#find' do 
    it 'returns a single peep' do 
      repo = PeepRepository.new

      peeps = repo.all 

      expect(peeps.length).to eq 3
      expect(peeps.first.message).to eq 'Eating Breakfast'
      expect(peeps.first.created_at).to eq '2002-12-04 10:23:54'
      expect(peeps.first.user_id).to eq 1

      expect(peeps.last.message).to eq 'Going for a walk'
      expect(peeps.last.created_at).to eq '2002-12-02 12:39:42'
      expect(peeps.last.user_id).to eq 2
    end 
  end 

   context '#create' do 
     it 'creates a new peep' do
       repo = PeepRepository.new 

       new_peep = Peep.new
       new_peep.message = 'Craving chocolate'
       new_peep.created_at = '2002-12-04 14:32:09'
       new_peep.user_id = '2'
       repo.create(new_peep)

       peeps = repo.all
       expect(peeps.length).to eq 4
       expect(peeps.first.message).to eq 'Craving chocolate'
       expect(peeps.first.created_at).to eq '2002-12-04 14:32:09'
       expect(peeps.first.user_id).to eq 2
     end
   end  
 end
