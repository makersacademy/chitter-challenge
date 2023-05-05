require 'user_repository'

def reset_user_table
  sql_seeds = File.read("spec/seeds_users.sql")
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec sql_seeds
end

describe UserRepository do
  before(:each) do
    reset_user_table
  end

  describe '#all' do
    it 'returns a list of all users' do
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq 4

      expect(users).to include(
        have_attributes(
          id: 1,
          email: 'email_1',
          password: 'password_1',
          name: 'name_1',
          username: 'username_1'
        )
      )

      expect(users).to include(
        have_attributes(
          id: 3,
          email: 'email_3',
          password: 'password_3',
          name: 'name_3',
          username: 'username_3'
        )
      )
    end
  end

  describe '#find' do
    it 'returns a user by id' do
      repo = UserRepository.new
      user = repo.find(1)
      expect(user.id).to eq 1
      expect(user.email).to eq 'email_1'
      expect(user.password).to eq 'password_1'
      expect(user.name).to eq 'name_1'
      expect(user.username).to eq 'username_1'
    end

    it 'returns another user by id' do
      repo = UserRepository.new
      user = repo.find(3)
      expect(user.id).to eq 3
      expect(user.email).to eq 'email_3'
      expect(user.password).to eq 'password_3'
      expect(user.name).to eq 'name_3'
      expect(user.username).to eq 'username_3'
    end
  end

  describe '#create' do
    it "creates a new user in the database" do
      user = User.new
      user.email = 'new_email'
      user.password = 'new_password'
      user.name = 'new_name'
      user.username = 'new_username'
      
      repo = UserRepository.new
      repo.create(user)
      
      expect(repo.all).to include(
        have_attributes(
          id: 5,
          email: 'new_email',
          password: 'new_password',
          name: 'new_name',
          username: 'new_username'
        )
      )
    end
  end
end
