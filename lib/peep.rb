require_relative './user'

class Peep
  attr_accessor :id, :message, :created_at, :user_id 

  def user 
    sql = 'SELECT * FROM users WHERE id = $1'
    result_set = DatabaseConnection.exec_params(sql, [user_id])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.email_address = result_set[0]['email_address']

    user
  end 
end
