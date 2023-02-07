require_relative "./user"
class UserRepository
  def all 
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql,[])

    users = []
    result_set.each do |record|
      user = User.new 
      user.id = record['id'].to_i
      user.email = record['email']
      user.password = record['password']
      user.name = record['name']
      user.username = record['username']
    
    users << user 
    end
  return users
  end

  def create(user)
    sql = 'INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4);'
    params = [user.email, user.password, user.name, user.username]

    DatabaseConnection.exec_params(sql,params)
    return nil
  end 
end 