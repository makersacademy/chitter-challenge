require 'user.rb'
require 'user_repository.rb'

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'peeps_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  let(:repo) { UserRepository.new }

  describe '#all' do
    it 'lists all users' do
      users = repo.all
      expect(users[0].username).to eq 'user1'
      expect(users[0].email).to eq 'user1@example.com'
      expect(users[1].username).to eq 'user2'
      expect(users[1].email).to eq 'user2@example.com'
    end
  end
end