require 'user'
require 'user_repository'

def reset_tables
  user_seed_sql = File.read('spec/seeds/seeds_users.sql')
  peep_seed_sql = File.read('spec/seeds/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(user_seed_sql)
  connection.exec(peep_seed_sql)
end

describe UserRepository do

  before(:each) do 
    reset_tables
  end

  context '#find' do 
    it 'returns a single user' do 
      repo = UserRepository.new

      user = repo.find(2)

      expect(user.id).to eq 2
      expect(user.email_address).to eq 'cecily@gmail.com'
      expect(user.password).not_to eq nil 
    end 
  end

  context '#create' do 
    it 'creates a new user' do 
      repo = UserRepository.new 

      user = User.new
      user.email_address = 'april@gmail.com'
      user.password = 'sims2_Pets'
      new_user = repo.create(user)

      expect(new_user.email_address).to eq 'april@gmail.com'
      expect(new_user.password).to eq user.password
    end 
  end 

end
