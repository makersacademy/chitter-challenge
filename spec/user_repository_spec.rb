require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test'})
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_users_table
  end

  describe '#all' do
    it 'finds all users' do
      repo = UserRepository.new

      users = repo.all

      expect(users.length).to eq(2)
      expect(users.first.name).to eq('Ruby')
    end
  end
end