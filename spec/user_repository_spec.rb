require 'user'
require 'user_repository'

describe UserRepository do
  def reset_tables
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  context 'all method' do
    it 'finds all users' do
      repo = UserRepository.new
      all_users = repo.all
      first_user = all_users.first
      last_user = all_users.last
      expect(all_users.length).to eq 4
      expect(first_user.id).to eq 1
      expect(first_user.name).to eq 'Jude'
      expect(first_user.email_address).to eq 'jude@jude.com'
      expect(first_user.username).to eq 'jude94'
      expect(last_user.id).to eq 4
      expect(last_user.name).to eq 'Mo'
      expect(last_user.email_address).to eq 'mo@mo.com'
      expect(last_user.username).to eq 'mo**11'
    end
  end

  context 'find(id) method' do
    it 'finds a single user' do
      repo = UserRepository.new
      user = repo.find(1)
      expect(user.id).to eq 1
      expect(user.name).to eq 'Jude'
      expect(user.email_address).to eq 'jude@jude.com'
      expect(user.username).to eq 'jude94'

    end

    it 'finds another single user' do
      repo = UserRepository.new
      user = repo.find(4)
      expect(user.id).to eq 4
      expect(user.name).to eq 'Mo'
      expect(user.email_address).to eq 'mo@mo.com'
      expect(user.username).to eq 'mo**11'
    end
  end

  context 'create method' do
    it 'creates a new user' do
      repo = UserRepository.new
      user = User.new
      user.name = 'Sarah'
      user.email_address = 'sarah@sarah.com'
      user.username = 'sarah2468'
      user.password = 'sarahisdabest'
      repo.create(user)
      new_user = repo.all.last
      expect(new_user.name).to eq 'Sarah'
      expect(new_user.email_address).to eq 'sarah@sarah.com'
      expect(new_user.username).to eq 'sarah2468'
    end
  end

  context 'already_exists? method' do
    it 'checks if a user alrady exists with that username' do
      repo = UserRepository.new
      user = User.new
      user.name = 'Bob'
      user.email_address = 'bob@bob.com'
      user.username = 'billy_1956'
      user.password = 'billybillybilly'
      expect(repo.already_exists?(user)).to eq true
    end

    it 'checks if a user already exists with that email_address' do
      repo = UserRepository.new
      user = User.new
      user.name = 'Bob'
      user.email_address = 'billy@billy.com'
      user.username = 'bob12345'
      user.password = 'bobbobbob'
      expect(repo.already_exists?(user)).to eq true
    end

    it 'returns false if no users exist that match' do
      repo = UserRepository.new
      user = User.new
      user.name = 'John'
      user.email_address = 'john@john.com'
      user.username = 'john9876'
      user.password = 'johnjohnjohn'
      expect(repo.already_exists?(user)).to eq false
    end
  end

  context 'find_by_username' do
    it 'returns nil if user does not exist' do
      repo = UserRepository.new
      user = repo.find_by_username('username that does not exist')
      expect(user).to eq nil
    end

    it 'returns the correct user if it exists' do
      repo = UserRepository.new
      user = repo.find_by_username('jude94')
      expect(user.username).to eq 'jude94'
      expect(user.email_address).to eq 'jude@jude.com'
    end
  end
end
