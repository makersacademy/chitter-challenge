require_relative "account"
require_relative "database_connection"
require "bcrypt"

class AccountRepository
  def initialize(encrypter = BCrypt::Password)
    @encrypter = encrypter
  end
  
  def all
    sql_query = "SELECT id, email, password, name, username FROM accounts;"
    query_result = DatabaseConnection.exec_params(sql_query, [])

    accounts = []
    query_result.each do |record|
      accounts << extract_account_from_record(record)
    end
    return accounts
  end

  def find(id)
    sql_query = "SELECT id, email, password, name, username FROM accounts WHERE id = $1;"
    query_result = DatabaseConnection.exec_params(sql_query, [id])

    fail IndexError.new "There is no account with ID #{id}" if query_result.first.nil?
    return extract_account_from_record(query_result.first)
  end

  def find_with_username(username)
    sql_query = "SELECT id, email, password, name, username FROM accounts WHERE username = $1;"
    query_result = DatabaseConnection.exec_params(sql_query, [username])
    
    fail KeyError.new(
      "No accounts exist with the username '#{username}'"
    ) if query_result.first.nil?
    return extract_account_from_record(query_result.first)
  end

  def create(account)
    fail ArgumentError.new "An account cannot have an empty argument" if empty_field?(account)
    fail ArgumentError.new "Please enter a valid email address" unless valid_email_address?(
      account.email
    )

    encrypted_password = @encrypter.create(account.password)
    sql_query = "INSERT INTO accounts (email, password, name, username) VALUES ($1, $2, $3, $4);"
    params = [account.email, encrypted_password, account.name, account.username]
    DatabaseConnection.exec_params(sql_query, params)
    return nil
  end

  private

  def extract_account_from_record(record)
    account = Account.new
    account.id = record["id"].to_i
    account.email = record["email"]
    account.password = record["password"]
    account.name = record["name"]
    account.username = record["username"]
    return account
  end

  def empty_field?(account)
    return account.email.empty? ||
    account.password.empty? ||
    account.name.empty? ||
    account.username.empty?
  end

  def valid_email_address?(address)
    return address.match?(
      /^[a-z\.]+@[a-z]+\.com$/
    )
  end
end
