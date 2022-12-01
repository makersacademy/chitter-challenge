require_relative 'account'

class AccountRepository
  def all
    accounts = []

    # Send the SQL query and get the result set.
    sql = 'SELECT account_id, username FROM accounts;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      account = Account.new
      account.account_id = record['account_id'].to_i
      account.username = record['username']

      accounts << account
    end

    return accounts
  end

  def find(id)
    sql = 'SELECT account_id, username FROM accounts WHERE account_id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    account = Account.new
    account.account_id = result_set[0]['account_id'].to_i
    account.username = result_set[0]['username']

    return account
  end

  def create(account)
    sql = 'INSERT INTO accounts (username, password) VALUES ($1, $2);'
    result_set = DatabaseConnection.exec_params(sql, [account.username, account.password])

    return account
  end
end