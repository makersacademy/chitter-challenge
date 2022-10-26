require 'user_repository'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_development' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_tables
  end

  describe '#user_from_record' do
    it 'creates a User object from a SQL query record' do
      record = {
        'id' => '123',
        'email' => 'email@email.com',
        'password' => 'password',
        'name' => 'name',
        'username' => 'username'
      }
      repo = UserRepository.new
      user = repo.user_from_record(record)

      expect(user.id).to eq 123
      expect(user.email).to eq 'email@email.com'
      expect(user.password).to eq 'password'
      expect(user.name).to eq 'name'
      expect(user.username).to eq 'username'
    end
  end

  describe '#all' do
    it 'returns all users as an array of User objects' do
      repo = UserRepository.new

      users = repo.all

      expect(users.length).to eq 3
      expect(users.first.id).to eq 1
      expect(users.first.email).to eq 'email_1@email.com'
      expect(users.first.name).to eq 'user_1'
      expect(users.first.username).to eq 'username_1'
      expect(users.first.password).to eq '$2a$12$YHla9QIlKIi/sC/kf4aIoORjRJR2HfzYVr6d546JJ7BMvV15ZpzpO'
      expect(users.last.id).to eq 3
      expect(users.last.email).to eq 'email_3@email.com'
      expect(users.last.name).to eq 'user_3'
      expect(users.last.username).to eq 'username_3'
      expect(users.last.password).to eq '$2a$12$X8IqacWC7NXqp7mJUPDcAuWQm4b4BwvezoPksj6h53jF2l7SU0VYi'
    end
  end

  describe '#find_by_id' do
    it 'returns an User object given an ID' do
      repo = UserRepository.new

      id_to_find = 2
      user = repo.find_by_id(id_to_find)

      expect(user.id).to eq 2
      expect(user.email).to eq 'email_2@email.com'
      expect(user.password).to eq '$2a$12$cZe8SPDM3nanKwHCpUmfx.OIfLhDezopqQRDxYIHJaDzF9t8lhT12'
      expect(user.name).to eq 'user_2'
      expect(user.username).to eq 'username_2'
    end

    it 'returns nil if there is not match' do
      repo = UserRepository.new

      id_to_find = 100
      expect(repo.find_by_id(id_to_find)).to eq nil
    end
  end

  describe '#find_by_email' do
    it 'returns an User object given an email' do
      repo = UserRepository.new

      email_to_find = 'email_1@email.com'
      user = repo.find_by_email(email_to_find)

      expect(user.id).to eq 1
      expect(user.email).to eq 'email_1@email.com'
      expect(user.password).to eq '$2a$12$YHla9QIlKIi/sC/kf4aIoORjRJR2HfzYVr6d546JJ7BMvV15ZpzpO'
      expect(user.name).to eq 'user_1'
      expect(user.username).to eq 'username_1'
    end

    it 'returns nil if there is not match' do
      repo = UserRepository.new

      email_to_find = 'email_email@email.com'
      expect(repo.find_by_email(email_to_find)).to eq nil
    end
  end

  describe '#find_by_username' do
    it 'returns an User object given a username' do
      repo = UserRepository.new

      username_to_find = 'username_1'
      user = repo.find_by_username(username_to_find)

      expect(user.id).to eq 1
      expect(user.email).to eq 'email_1@email.com'
      expect(user.password).to eq '$2a$12$YHla9QIlKIi/sC/kf4aIoORjRJR2HfzYVr6d546JJ7BMvV15ZpzpO'
      expect(user.name).to eq 'user_1'
      expect(user.username).to eq 'username_1'
    end

    it 'returns nil if there is not match' do
      repo = UserRepository.new

      username_to_find = 'username_100'
      expect(repo.find_by_username(username_to_find)).to eq nil
    end
  end

  describe '#create' do
    it 'creates a new user record given a User object' do
      repo = UserRepository.new
      number_of_users = repo.all.length

      user = User.new
      user.email = 'new_user@email.com'
      user.password = 'new_password'
      user.name = 'New User'
      user.username = 'new_username'

      repo.create(user)

      updated_number_of_users = repo.all.length

      expect(updated_number_of_users).to eq(number_of_users + 1)
      expect(repo.all).to include(
        have_attributes(
          email: 'new_user@email.com',
          password: 'new_password',
          name: 'New User',
          username: 'new_username'
        )
      )
    end

    it 'raises an error if email address is not unique' do
      repo = UserRepository.new

      user = User.new
      user.email = 'email_1@email.com'
      user.password = 'new_password'
      user.name = 'New User'
      user.username = 'new_username'

      expect { repo.create(user) }.to raise_error 'Email address and/or username already in use'
    end

    it 'raises an error if username is not unique' do
      repo = UserRepository.new

      user = User.new
      user.email = 'new_email@email.com'
      user.password = 'new_password'
      user.name = 'New User'
      user.username = 'username_3'

      expect { repo.create(user) }.to raise_error 'Email address and/or username already in use'
    end

    it 'raises an error if email address and username are not unique' do
      repo = UserRepository.new

      user = User.new
      user.email = 'email_1@email.com'
      user.password = 'new_password'
      user.name = 'New User'
      user.username = 'username_3'

      expect { repo.create(user) }.to raise_error 'Email address and/or username already in use'
    end
  end
end
