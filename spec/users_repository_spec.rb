require 'users'
require 'users_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_tables
  end

  describe '#all' do
    it 'lists all users' do
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq(3)
      expect(users.first.id).to eq(1)
      expect(users.first.username).to eq('orangeman')
      expect(users.first.email).to eq('donald@example.com')
      expect(users.last.id).to eq(3)
    end
  end

  describe '#create' do
    it 'creates a new user' do
      repo = UserRepository.new
      user = repo.create(
        username: 'test user',
        name: 'test name',
        password_hash: '123456',
        email: 'test@example.com'
      )

      users = repo.all
      expect(user.id).to eq(4)
      expect(user.username).to eq('test user')
      expect(user.name).to eq('test name')
      expect(user.email).to eq('test@example.com')

      
      expect(user.password_hash).to eq('123456                                                      ')
    end
  end

  describe '#find' do
    it 'finds a user by email' do
      repo = UserRepository.new
      user = repo.find_user_by_email('donald@example.com')

      expect(user.id).to eq(1)
      expect(user.username).to eq('orangeman')
      expect(user.name).to eq('Donald')
      expect(user.email).to eq('donald@example.com')
    end
  end
end