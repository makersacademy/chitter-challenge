require_relative '../lib/user.rb'
require_relative '../lib/user_repository.rb'

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
  let(:user) { User.new}

  describe '#all' do
    it 'lists all users' do
      users = repo.all
      expect(users[0].username).to eq 'user1'
      expect(users[0].email).to eq 'user1@example.com'
      expect(users[1].username).to eq 'user2'
      expect(users[1].email).to eq 'user2@example.com'
    end
  end

  describe '#create' do
    it 'adds a new user to the table' do
      user.username = 'user3'
      user.email = 'user3@example.com'
      user.password = '12345678'

      new_user = repo.create(user)
      all_users = repo.all

      expect(all_users.last.username).to eq 'user3'
      expect(all_users.last.email).to eq 'user3@example.com'
      expect(BCrypt::Password.new(all_users.last.password)).to eq '12345678'
    end
  end
end