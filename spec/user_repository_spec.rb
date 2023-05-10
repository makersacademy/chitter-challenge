require 'user_repository'

RSpec.describe UserRepository do
  def reset_chitter_tables
    seed_sql = File.read('spec/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_chitter_tables
  end    

  context 'The All Method' do
    it 'returns all the users' do
      repo = UserRepository.new
      users = repo.all
      
      expect(users.length).to eq 2
      expect(users.first.name).to eq 'Jack'
      expect(users.first.email).to eq 'jack@email.com'
      expect(users.first.username).to eq 'skates'
    end
  end

  context 'The Find Method' do
    it 'should return a user with the username as an input' do
      repo = UserRepository.new
      user = repo.find('skates')

      expect(user.username).to eq 'skates'
      expect(user.name).to eq 'Jack'
      expect(user.email).to eq 'jack@email.com'
    end
  end

  context 'The Create Method' do
    it 'should create a new user and add it to the database' do
      repo = UserRepository.new

      user = User.new
      user.name = 'Charlie'
      user.email = 'charliekelly@paddyspub.com'
      user.username = 'TheDayman'

      repo.create(user)
      users = repo.all
      new_user = users.last

      expect(new_user.name).to eq 'Charlie'
      expect(new_user.email).to eq 'charliekelly@paddyspub.com'
      expect(new_user.username).to eq 'TheDayman'
      expect(new_user.id).to eq '3'
    end
  end
end
