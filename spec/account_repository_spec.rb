require "account_repository"

def reset_accounts_table
  seed_sql = File.read('spec/seeds/seeds_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec(seed_sql)
end

describe AccountRepository do
  before(:each) do 
    reset_accounts_table
  end

  it "Get all accounts" do
    account_repo = AccountRepository.new
    accounts = account_repo.all

    expect(accounts.length).to eq 3

    expect(accounts.first.id).to eq 1
    expect(accounts.first.email).to eq "thomas@email.com"
    expect(accounts.first.password).to eq "password"
    expect(accounts.first.name).to eq "Thomas Seleiro"
    expect(accounts.first.username).to eq "TSeleiro"

    expect(accounts.last.id).to eq 3
    expect(accounts.last.email).to eq "robbie@email.com"
    expect(accounts.last.password).to eq "1234hello1234"
    expect(accounts.last.name).to eq "Robbie Kirkbride"
    expect(accounts.last.username).to eq "RKirkbride"
  end

  it "Finds an account with a given account id" do
    account_repo = AccountRepository.new
    account = account_repo.find(2)

    expect(account.id).to eq 2
    expect(account.email).to eq "graeme@email.com"
    expect(account.password).to eq "P@$$w0rd"
    expect(account.name).to eq "Graeme Paterson"
    expect(account.username).to eq "GPaterson"
  end

  it "#find fails when given an invalid account id" do
    account_repo = AccountRepository.new
    error_message = "There is no account with ID 4"
    expect { account_repo.find(4) }.to raise_error error_message
  end

  it "#create adds an account to the database" do
    account_repo = AccountRepository.new
    new_account = Account.new
    new_account.email = "shah@email.com"
    new_account.password = "12344321"
    new_account.name = "Shah Hussain"
    new_account.username = "SHussain"

    account_repo.create(new_account)

    expect(account_repo.all).to include(have_attributes(
      id: 4,
      email: "shah@email.com",
      password: "12344321",
      name: "Shah Hussain",
      username: "SHussain"
    ))
  end

  it "#create fails when adding an account with an existing username" do
    account_repo = AccountRepository.new
    new_account = Account.new
    new_account.email = "thomas@email.com"
    new_account.password = "12344321"
    new_account.name = "Shah Hussain"
    new_account.username = "SHussain"

    expect { account_repo.create(new_account) }.to raise_error PG::UniqueViolation
  end

  it "#create fails when adding an account with an existing password" do
    account_repo = AccountRepository.new
    new_account = Account.new
    new_account.email = "shah@email.com"
    new_account.password = "12344321"
    new_account.name = "Shah Hussain"
    new_account.username = "TSeleiro"

    expect { account_repo.create(new_account) }.to raise_error PG::UniqueViolation
  end

  it "#create fails when any field is empty" do
    account_repo = AccountRepository.new
    new_account = Account.new
    error_message = "An account cannot have an empty argument"

    new_account.email = ""
    new_account.password = "12344321"
    new_account.name = "Shah Hussain"
    new_account.username = "SHussain"
    expect { account_repo.create(new_account) }.to raise_error error_message

    new_account.email = "shah@email.com"
    new_account.password = ""
    expect { account_repo.create(new_account) }.to raise_error error_message

    new_account.password = "12344321"
    new_account.name = ""
    expect { account_repo.create(new_account) }.to raise_error error_message

    new_account.name = "Shah Hussain"
    new_account.username = ""
    expect { account_repo.create(new_account) }.to raise_error error_message
  end

  it "#create fails when entering a poorly formatted email address" do
    account_repo = AccountRepository.new
    error_message = "Please enter a valid email address"

    new_account = Account.new
    new_account.password = "12344321"
    new_account.name = "Shah Hussain"
    new_account.username = "SHussain"

    new_account.email = "abc-@email.com"
    expect { account_repo.create(new_account) }.to raise_error error_message
    new_account.email = "abc#def@email.com"
    expect { account_repo.create(new_account) }.to raise_error error_message
    new_account.email = "shah@emailcom"
    expect { account_repo.create(new_account) }.to raise_error error_message
    new_account.email = "shah@email.net"
    expect { account_repo.create(new_account) }.to raise_error error_message
    new_account.email = "abc-@.com"
    expect { account_repo.create(new_account) }.to raise_error error_message
    new_account.email = "abc-@em ail.com"
    expect { account_repo.create(new_account) }.to raise_error error_message
  end
end
