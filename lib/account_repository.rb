require_relative 'account'

class AccountRepository
  def all
    accounts = []

    # Send the SQL query and get the result set.
    sql = 'SELECT account_id, 
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
      account = Account.new
      account.account_id = record['account_id'].to_i
      account.email = record['email']
      account.name = record['name']
      account.username = record['username']
      account.bio = record['bio']

      accounts << account
    end

    return accounts
  end

  def find(id)
    sql = 'SELECT account_id,
                  email, 
                  name, 
                  username, 
                  bio 
    FROM accounts 
    WHERE account_id = $1;'
    
    result_set = DatabaseConnection.exec_params(sql, [id])

    account = Account.new
    account.account_id = result_set[0]['account_id'].to_i
    account.email = result_set[0]['email']
    account.name = result_set[0]['name']
    account.username = result_set[0]['username']
    account.bio = result_set[0]['bio']

    return account
  end

  def create(account)
    # Encrypt the password to save it into the new database record.
    encrypted_password = BCrypt::Password.create(account.password)

    sql = 'INSERT INTO accounts (email, password, name, username, bio) VALUES ($1, $2, $3, $4, $5);'
    result_set = DatabaseConnection.exec_params(sql, [account.email, encrypted_password, account.name, account.username, account.bio])

    return account
  end
end

