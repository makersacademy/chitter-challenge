require_relative 'users'

class UserRepository
  def all 
    users = []
    sql = 'SELECT * from users;'
    result_set = DatabaseConnection.exec_params(sql, [])
end