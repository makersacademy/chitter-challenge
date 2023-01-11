require 'user_repo'
require 'user'

def reset_table
  seed_sql = File.read('spec/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepo do
  before(:each) do
    reset_table
    @repo = UserRepo.new
  end
  after(:each) { reset_table }

  context 'runs the .all method' do
    it 'returns all users' do
      expect(@repo.all.length).to eq(2)
      expect(@repo.all[0].name).to eq('name1')
      expect(@repo.all[0].username).to eq('username1')
    end
  end

  context 'creates a new user' do
    it 'adds a user to the database' do
      user = User.new
      user.name = 'test'
      user.username = 'test'
      user.email = 'test'
      user.password = 'test'
      @repo.create(user)
      expect(@repo.all.length).to eq(3)
      expect(@repo.all.last.name).to eq('test')
    end
  end
end
