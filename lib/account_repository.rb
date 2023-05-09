require_relative './account'

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
    sql = 'SELECT id, email_address, username, name, password FROM accounts WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]
    
    return record_to_account(record)
  end

  def add(account)
    sql = 'INSERT INTO accounts (email_address, username, name, password) VALUES ($1, $2, $3, $4);'
    sql_params = [account.email_address, account.username, account.name, account.password]

    DatabaseConnection.exec_params(sql, sql_params)

    return nil
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
