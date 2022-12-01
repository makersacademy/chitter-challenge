require_relative 'account'

class AccountRepository
  def all
    artists = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, username FROM accounts;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      account = Account.new
      account.id = record['id'].to_i
      account.username = record['username']

      accounts << account
    end

    return accounts
  end

  def find(id)
    sql = 'SELECT id, username FROM accounts WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    account = Account.new
    account.id = result_set[0]['id'].to_i
    account.username = result_set[0]['username']

    return account
  end

  def create(artist)
    sql = 'INSERT INTO accounts (username, password) VALUES ($1, $2);'
    result_set = DatabaseConnection.exec_params(sql, [account.username, account.genre])

    return account
  end
end