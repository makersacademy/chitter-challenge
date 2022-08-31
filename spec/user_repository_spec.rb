require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/chitter_test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe UserRepository do

  before(:each) do 
    reset_users_table
  end

  describe 'all' do
    it 'Creates array of all users' do
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq 3

      expect(users[0].id).to eq 1
      expect(users[0].username).to eq 'ted453'
      expect(users[0].name).to eq 'Ted D'
      expect(users[0].email).to eq 'tedd@hotmailtest.com'
      expect(users[0].password).to eq 'qwerty123'

      expect(users[1].id).to eq 2
      expect(users[1].name).to eq 'Jemm Platz'
      expect(users[1].email).to eq 'JSpace@yahoot.com'
    end
  end
  describe 'find' do
    it 'returns the user object for id 1' do
      repo = UserRepository.new

      user = repo.find(1)
      expect(user.id).to eq 1
      expect(user.username).to eq 'ted453'
      expect(user.name).to eq 'Ted D'
      expect(user.email).to eq 'tedd@hotmailtest.com'
      expect(user.password).to eq 'qwerty123'
    end
    it 'returns the user object for id 3' do
      repo = UserRepository.new

      user = repo.find(3)

      expect(user.id).to eq 3
      expect(user.username).to eq 'user123'
      expect(user.name).to eq 'Anon Ymouse'
      expect(user.email).to eq 'is_a_user@user.com'
      expect(user.password).to eq 'password_123'
    end
  end
  describe 'create' do
    it 'adds a new user to the database' do
      repo = UserRepository.new
      user = User.new
      user.username = 'newTest45'
      user.name = 'Justa Test'
      user.email = 'testing@tests.com'
      user.password = '321tset'
      repo.create(user)

      all_users = repo.all

      expect(all_users.length).to eq 4
      expect(all_users[3].name).to eq 'Justa Test'
      expect(all_users.last.password).to eq '321tset'
    end
  end
end
