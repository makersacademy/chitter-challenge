class Account
  attr_accessor :id, :email_address, :username, :name, :password

  def unique?
    sql = "SELECT * FROM accounts WHERE email_address=$1::text OR username=$2::text;"
    sql_params = [email_address, username]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    return result_set.to_a.length == 0 
  end

end
