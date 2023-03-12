require 'user_repository'
require 'user'

def reset_users_table
  seed_sql = File.read('spec/seeds/users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_peeps_table
    reset_users_table
  end

  context '#all' do
    it 'returns the correct amount of users in the database' do
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq(4)
    end

    it 'returns correct data for user' do
      repo = UserRepository.new
      users = repo.all

      expect(users[0].id).to eq(1)
      expect(users[0].name).to eq('Konrad')
      expect(users[0].username).to eq('kdun')
      expect(users[0].email).to eq('konrad@gmail.com')
      expect(users[0].password).to eq('konrad')
    end

    it 'returns correct data for user' do
      repo = UserRepository.new
      users = repo.all

      expect(users[3].id).to eq(4)
      expect(users[3].name).to eq('Jellybean')
      expect(users[3].username).to eq('jelly')
      expect(users[3].email).to eq('jelly@hotmail.com')
      expect(users[3].password).to eq('feedme')
    end
  end

  
end
