require_relative 'account'
require 'bcrypt'

class AccountRepository
  def all
    accounts = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, 
                  email, 
                  name, 
                  username, 
                  bio 
    FROM accounts;'

    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      accounts << record_info(record)
    end

    return accounts
  end

  def find_by_id(id)
    sql = 'SELECT id,
                  email, 
                  name, 
                  username, 
                  bio 
    FROM accounts 
    WHERE id = $1;'
    
    result_set = DatabaseConnection.exec_params(sql, [id])

    record = result_set[0]
    return record_info(record)
  end

  def find_by_email(email)
    sql = 'SELECT id,
                  email,
                  password,
                  name, 
                  username, 
                  bio 
    FROM accounts 
    WHERE email = $1;'
    
    result_set = DatabaseConnection.exec_params(sql, [email])

    record = result_set[0]
    return record_info(record)
  end

  def create(account)
    # Encrypt the password to save it into the new database record.
    encrypted_password = BCrypt::Password.create(account.password)

    sql = 'INSERT INTO accounts (email, password, name, username, bio) VALUES ($1, $2, $3, $4, $5);'
    result_set = DatabaseConnection.exec_params(sql, [account.email, encrypted_password, account.name, account.username, account.bio])

    return account
  end

  private

  def record_info(record)
    account = Account.new
    account.id = record['id']
    account.email = record['email']
    account.password = record['password']
    account.name = record['name']
    account.username = record['username']
    account.bio = record['bio']

    return account
  end
end

