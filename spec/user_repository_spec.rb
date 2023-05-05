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
end
