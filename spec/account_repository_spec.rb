require 'account'
require 'account_repository'

def reset_accounts_table
  seed_sql = File.read('spec/seeds/accounts_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe AccountRepository do
  before(:each) do 
    reset_accounts_table
  end

  xit 'finds all accounts' do
    repo = AccountRepository.new

    accounts = repo.all
    
    expect(accounts.length).to eq(7)
    expect(accounts.first.username).to eq('johndoe1234')
  end

  xit 'finds one account' do
    repo = AccountRepository.new

    account = repo.find(3)
    
    expect(account.id).to eq(3)
    expect(account.username).to eq('metallover666')
  end

  xit 'creates an account' do
    repo = AccountRepository.new

    account = Account.new
    account.username = 'cat-bot'
    account.password = 'whiskers123'
    repo.create(account)

    accounts = repo.all

    expect(accounts.length).to eq(8)
    expect(accounts.last.username).to eq('cat-bot')
  end
end