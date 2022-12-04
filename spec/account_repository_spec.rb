require "database_connection"
require "account_repository"
require 'pg'

def reset_accounts_table
  seed_sql = File.read('spec/accounts_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe AccountRepository do
  before(:each) do 
    reset_accounts_table
  end

  it "get all accounts" do
    repo = AccountRepository.new

    accounts = repo.all

    expect(accounts.length).to eq 4

    expect(accounts[0].id).to eq 1
    expect(accounts[0].email).to eq 'tom@gmail.com'
    expect(accounts[0].password).to eq 'pass1'
    expect(accounts[0].name).to eq 'Tom Seleiro'
    expect(accounts[0].username).to eq 'TomS'

    expect(accounts[1].id).to eq 2
    expect(accounts[1].email).to eq 'robbie@gmail.com'
    expect(accounts[1].password).to eq 'word2'
    expect(accounts[1].name).to eq 'Robbie Kirkbride'
    expect(accounts[1].username).to eq 'rwmk'
  end

    # 2
  it "Get a single account" do
    repo = AccountRepository.new

    account = repo.find(1)

    expect(account.id).to eq 1
    expect(account.email).to eq 'tom@gmail.com'
    expect(account.password).to eq 'pass1'
    expect(account.name).to eq 'Tom Seleiro'
    expect(account.username).to eq 'TomS'
  end

  it "Create a single account" do
    repo = AccountRepository.new
    account = Account.new
    account.email = 'anisha@gmail.com'
    account.password = 'he11o'
    account.name = 'Anisha Hirani'
    account.username = 'AHirani'
    repo.create(account)

    all_accounts = repo.all
    expect(all_accounts.last.id).to eq 5
    expect(all_accounts.last.email).to eq 'anisha@gmail.com'
    expect(all_accounts.last.name).to eq 'Anisha Hirani'
    expect(all_accounts.last.username).to eq 'AHirani'
  end

  it "finds an account by using the email" do
    repo = AccountRepository.new
    account = repo.find_by_email('shah@gmail.com')
    expect(account.email).to eq 'shah@gmail.com'
    expect(account.name).to eq 'Shah Hussain'
    expect(account.password).to eq '123'
    expect(account.username).to eq 'SH99'
  end
end