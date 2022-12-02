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

    expect(accounts.first).to have_attributes(
      id: 1,
      email: "thomas@email.com",
      password: "$2a$12$1CrGiZefwfjMBHXzRwf.ROQtx1lt.vaXwbgAl1fQEJYXwVVwEY9LO",
      name: "Thomas Seleiro",
      username: "TSeleiro"
    )
    expect(accounts.last).to have_attributes(
      id: 3,
      email: "robbie@email.com",
      password: "$2a$12$cHmw7YQKvYh/Fy/k37YUZuldl.b5Y3.cNpojS8Kn1yjmmE8y1trVa",
      name: "Robbie Kirkbride",
      username: "RKirkbride"
    )
  end

  it "Finds an account with a given account id" do
    account_repo = AccountRepository.new
    account = account_repo.find(2)

    expect(account).to have_attributes(
      id: 2,
      email: "graeme@email.com",
      password: "$2a$12$fALqEuM793QuKQfp3x3H2e9B.5yM3ftUqGoBKk1a2bV3mt2fwoxri",
      name: "Graeme Paterson",
      username: "GPaterson"
    )
  end

  it "#find fails when given an invalid account id" do
    account_repo = AccountRepository.new
    error_message = "There is no account with ID 4"
    expect { account_repo.find(4) }.to raise_error IndexError, error_message
  end

  it "#create adds an account to the database" do
    encrypted_password_double = double(:fake_password)
    expect(encrypted_password_double).to receive(:to_s)
      .and_return("$2a$12$f/cdOsF7jt6uUWDlEOxebOpIsC2kCD3G1Q3G6TnqXjyqho3JVT3/6")

    bcrypt_double = double(:fake_bcrypt)
    expect(bcrypt_double).to receive(:create).with("12344321")
      .and_return(encrypted_password_double)
    
    account_repo = AccountRepository.new(bcrypt_double)
    new_account = Account.new
    new_account.email = "shah@email.com"
    new_account.password = "12344321"
    new_account.name = "Shah Hussain"
    new_account.username = "SHussain"

    account_repo.create(new_account)

    expect(account_repo.all).to include(have_attributes(
      id: 4,
      email: "shah@email.com",
      password: "$2a$12$f/cdOsF7jt6uUWDlEOxebOpIsC2kCD3G1Q3G6TnqXjyqho3JVT3/6",
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
    expect { account_repo.create(new_account) }.to raise_error ArgumentError, error_message

    new_account.email = "shah@email.com"
    new_account.password = ""
    expect { account_repo.create(new_account) }.to raise_error ArgumentError, error_message

    new_account.password = "12344321"
    new_account.name = ""
    expect { account_repo.create(new_account) }.to raise_error ArgumentError, error_message

    new_account.name = "Shah Hussain"
    new_account.username = ""
    expect { account_repo.create(new_account) }.to raise_error ArgumentError, error_message
  end

  it "#create fails when entering a poorly formatted email address" do
    account_repo = AccountRepository.new
    error_message = "Please enter a valid email address"

    new_account = Account.new
    new_account.password = "12344321"
    new_account.name = "Shah Hussain"
    new_account.username = "SHussain"

    new_account.email = "abc-@email.com"
    expect { account_repo.create(new_account) }.to raise_error ArgumentError, error_message
    new_account.email = "abc#def@email.com"
    expect { account_repo.create(new_account) }.to raise_error ArgumentError, error_message
    new_account.email = "shah@emailcom"
    expect { account_repo.create(new_account) }.to raise_error ArgumentError, error_message
    new_account.email = "shah@email.net"
    expect { account_repo.create(new_account) }.to raise_error ArgumentError, error_message
    new_account.email = "abc-@.com"
    expect { account_repo.create(new_account) }.to raise_error ArgumentError, error_message
    new_account.email = "abc-@em ail.com"
    expect { account_repo.create(new_account) }.to raise_error ArgumentError, error_message
  end
end
