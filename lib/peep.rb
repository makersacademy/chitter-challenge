class Peep
  attr_accessor :id, :time, :contents, :account_id

  def find_username
    sql = 'SELECT username FROM accounts where id = $1'
    sql_params = [account_id]

    result = DatabaseConnection.exec_params(sql, sql_params)
 
    return result.to_a.first['username']
  end

  def find_name
    sql = 'SELECT name FROM accounts where id = $1'
    sql_params = [account_id]

    result = DatabaseConnection.exec_params(sql, sql_params)
 
    return result.to_a.first['name']
  end
end
