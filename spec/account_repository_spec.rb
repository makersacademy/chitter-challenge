require 'account'
require 'account_repository'
require 'bcrypt'

def reset_accounts_table
  seed_sql = File.read('spec/seeds/accounts_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe AccountRepository do
  before(:each) do 
    reset_accounts_table
  end

  describe '#all' do
    it 'returns all accounts' do
      repo = AccountRepository.new

      accounts = repo.all
      
      expect(accounts.length).to eq(7)
      expect(accounts.first.email).to eq('johndoe@mail.com')
      expect(accounts.first.name).to eq('John Doe')
      expect(accounts.first.username).to eq('johndoe1234')
      expect(accounts.first.bio).to eq('Hi, my name is John')
    end
  end

  describe '#find_by_id' do
    it 'finds one account by id value' do
      repo = AccountRepository.new

      account = repo.find_by_id(3)
      
      expect(account.id).to eq('3')
      expect(account.email).to eq('trooper666@aol.com')
      expect(account.name).to eq('Taylor Black')
      expect(account.username).to eq('headbanger666')
      expect(account.bio).to eq('Keep on rockin in the free world')
    end
  end

  describe '#find_by_email' do
    it 'finds one account by email value' do
      repo = AccountRepository.new

      account = repo.find_by_email('trooper666@aol.com')
      
      expect(account.email).to eq('trooper666@aol.com')
      expect(account.name).to eq('Taylor Black')
      expect(account.username).to eq('headbanger666')
      expect(account.bio).to eq('Keep on rockin in the free world')
    end
  end

  describe '#create' do
    it 'creates an account' do
      repo = AccountRepository.new

      account = Account.new
      account.email = 'rosachat@gmail.co.uk'
      account.password = 'whiskers123'
      account.name = 'Rosa Gato'
      account.username = 'cat-bot'
      account.bio = 'Meow 🐱'
      repo.create(account)

      accounts = repo.all

      expect(accounts.length).to eq(8)
      expect(accounts.last.email).to eq ('rosachat@gmail.co.uk')
      expect(accounts.last.name).to eq('Rosa Gato')
      expect(accounts.last.username).to eq('cat-bot')
      expect(accounts.last.bio).to eq('Meow 🐱')
    end
  end
end