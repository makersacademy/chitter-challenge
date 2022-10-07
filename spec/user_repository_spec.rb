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
      expect(users.first.id).to eq(1)
      expect(users.first.name).to eq('Ruby')
      expect(users.first.username).to eq('cute-cat')
      expect(users.first.email).to eq('ruby1@gmail.com')
      expect(users.first.password).to eq('12345')
    end
  end

  describe '#find' do
    it 'finds one user by id' do
      repo = UserRepository.new
      user = repo.find(1)

      expect(user.id).to eq(1)
      expect(user.name).to eq('Ruby')
      expect(user.username).to eq ('cute-cat')
      expect(user.email).to eq('ruby1@gmail.com')
      expect(user.password).to eq('12345') 
    end

    it 'finds user with id 2' do
      repo = UserRepository.new
      user = repo.find(2)

      expect(user.id).to eq(2)
      expect(user.name).to eq('Amethist')
      expect(user.username).to eq('foxlover')
      expect(user.email).to eq('ameth22@gmail.com')
      expect(user.password).to eq('123456') 
    end
  end
end