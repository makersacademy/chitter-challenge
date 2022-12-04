require_relative "account"
require 'bcrypt'

class AccountRepository

  def all
    sql = "SELECT id, email, password, name, username FROM accounts;"
    result_set = DatabaseConnection.exec_params(sql, [])
    accounts = []
    result_set.each do |record|
      accounts << unpack_record(record)
    end
    return accounts
  end

  def find(id)
    sql = "SELECT id, email, password, name, username FROM accounts WHERE id = $1;"
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    return unpack_record(record)
  end

  def create(account)
    encrypted_password = BCrypt::Password.create(account.password)
    sql = 'INSERT INTO accounts (email, password, name, username) VALUES ($1, $2, $3, $4);'
    params = [account.email, encrypted_password, account.name, account.username]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  def find_by_email(email)
    sql = 'SELECT id, email, password, name, username FROM accounts WHERE email = $1;'
    params = [email]
    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    return unpack_record(record)
  end

  private

  def unpack_record(record)
    account = Account.new
    account.id = record["id"].to_i
    account.email = record["email"]
    account.password = record["password"]
    account.name = record["name"]
    account.username = record["username"]
    return account
  end
end