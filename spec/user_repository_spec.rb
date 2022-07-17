require 'user_repository'
  
describe UserRepository do

  def reset_users_table
    seed_sql = File.read('spec/seeds/test_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_users_table
  end

  context 'return users' do 
    it 'return all users' do
      repo = UserRepository.new
      users = repo.all
      expect(users.length).to eq 2
      expect(users.first.name).to eq "Tam"
    end

    it 'return one user by their id' do
      repo = UserRepository.new
      user = repo.find("1")
      expect(user.name).to eq 'Tam'
      expect(user.email).to eq 'tam@mail.com'
      expect(user.username).to eq 'Tamy'
      expect(user.password).to eq '1234'
    end
  end

  context 'Create users' do
    it 'create a new user' do 
      repo = UserRepository.new
      new_user = User.new
      new_user.name = 'Tim Robsons'
      new_user.username = 'trob'
      new_user.email = 'trom@email.com'
      new_user.password = 'trob123'
      repo.create(new_user)
      users = repo.all
      expect(users.length).to eq 3
      expect(users.last.id).to eq '3'
      expect(users.last.name).to eq 'Tim Robsons'
    end
  end
end