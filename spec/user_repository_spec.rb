require 'user_repository'
require 'user'

def reset_users_table
  seed_sql = File.read('seeds/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # 1
  context '#all' do
    it "returns all users" do
      repo = UserRepository.new

      users = repo.all

      expect(users.length).to eq 2

      expect(users[0].id).to eq 1
      expect(users[0].name).to eq 'Bob'
      expect(users[0].username).to eq 'user1'

      expect(users[1].id).to eq 2
      expect(users[1].name).to eq 'Alex'
      expect(users[1].email).to eq 'alex@gmail.com'
      expect(users[1].password).to eq 'password2'
    end
  end

  # 2
  context '#find' do
    it "returns a single user" do
      repo = UserRepository.new

      user = repo.find(1)

      expect(user.id).to eq 1
      expect(user.name).to eq 'Bob'
      expect(user.username).to eq 'user1'
      expect(user.email).to eq 'bob@gmail.com'
      expect(user.password).to eq 'password1'
    end
  end

  # 3
    it "returs a single user by username" do
      repo = UserRepository.new

      user = repo.find_by_username('user2')

      expect(user.id).to eq 2
      expect(user.name).to eq 'Alex'
      expect(user.username).to eq 'user2'
    end


  # 4
  context '#create' do
    it "creates a new user" do
      new_user = User.new

      new_user.name = 'Matt'
      new_user.username = 'user3'
      new_user.email = 'matt@gmail.com'
      new_user.password = 'password3'

      repo = UserRepository.new

      repo.create(new_user)

      users = repo.all

      expect(users.length).to eq 3
      expect(users[2].name).to eq 'Matt'
    end
  end
end