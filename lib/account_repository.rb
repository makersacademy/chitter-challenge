require_relative './account'
require 'bcrypt'

class AccountRepository
  def all
    accounts = []
    sql = 'SELECT id, email_address, username, name, password FROM accounts;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      accounts << record_to_account(record)
    end
    return accounts
  end

  def find(id)
    sql = 'SELECT * FROM accounts WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    
    return record_to_account(record)
  end

  def add(account)
    encrypted_password = BCrypt::Password.create(account.password)
    sql = 'INSERT INTO accounts (email_address, username, name, password) VALUES ($1, $2, $3, $4);'
    sql_params = [account.email_address, account.username, account.name, encrypted_password] 

    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end

  # def sign_in(email_address, submitted_password)
  #   account = find_by_email_address(email_address)

  #   return nil if account.nil?

  #   stored_password = BCrypt::Password.new(account.password)
  #   return true if stored_password == submitted_password
    
  #   return false
  # end

  def find_by_email_address(email_address)
    sql = 'SELECT * FROM accounts WHERE email_address = $1;'
    sql_params = [email_address]

    result_set = DatabaseConnection.exec_params(sql, sql_params).first 
    
    return nil if result_set.to_a.empty?  
    
    return record_to_account(result_set)
  end 

  private   

  def record_to_account(record)
    account = Account.new
    account.id = record['id'].to_i
    account.email_address = record['email_address']
    account.username = record['username']
    account.name = record['name']
    account.password = record['password']

    return account
  end
end
