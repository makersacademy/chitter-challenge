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

  context '#users' do 
    it 'returns the user for a peep' do
      repo = PeepRepository.new

      peep = repo.find(1)

      expect(peep.user.email_address).to eq 'callum@gmail.com' 
    end 
  end
end
