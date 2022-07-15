require 'user'
require 'user_repository'

def reset_users_table
    seed_sql = File.read('spec/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end
  
describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  context 'return users' do 
    it 'return all users' do
      repo = UserRepository.new
      users = repo.all
      expect(users.length).to eq 3
      expect(users.first.name).to eq "name1"
    end

    it 'return one user by their id' do
      repo = UserRepository.new
      user = repo.find("1")
      expect(user.name).to eq 'name1'
      expect(user.email).to eq 'test1@email.com'
      expect(user.username).to eq 'username1'
      expect(user.password).to eq '123'
    end
  end
end