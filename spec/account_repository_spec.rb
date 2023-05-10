require 'account'
require 'account_repository'

def reset_accounts_table
  seed_sql = File.read('spec/seeds/accounts_and_peeps_tables.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe AccountRepository do

  before(:each) do
    reset_accounts_table
  end
  
  context 'with a database pre-loaded with accounts' do
    it 'returns a list of accounts' do
      repo = AccountRepository.new

      accounts = repo.all

      expect(accounts.length).to eq(3)
      expect(accounts.first.id).to eq(1)
      expect(accounts.first.email_address).to eq('alice@example.com')
      expect(accounts.first.username).to eq('alice1')
      expect(accounts.first.name).to eq('Alice Wood')
      expect(accounts.first.password).to eq('test123')
    end

    it 'returns the account details with id 2' do
      repo = AccountRepository.new

      account = repo.find(2)

      expect(account.id).to eq(2)
      expect(account.email_address).to eq('chris@example.com')
      expect(account.username).to eq('chris1')
      expect(account.name).to eq('Chris Wood')
      expect(account.password).to eq('test321')
    end
  end

  it 'creates a new account' do
    repo = AccountRepository.new

    account = Account.new
    account.email_address = 'leo@example.com'
    account.username = 'leo1'
    account.name = 'Leo Hetsch'
    account.password = 'test456'

    repo.add(account)

    accounts = repo.all

    expect(accounts.length).to eq(4)
    expect(accounts.last.email_address).to eq('leo@example.com')
    expect(accounts.last.username).to eq('leo1')
    expect(accounts.last.name).to eq('Leo Hetsch')
    expect(accounts.last.password).to eq('test456')
  end
end
