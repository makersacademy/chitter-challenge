require_relative "./user"

class UserRepository

  
  def all

    sql = 'SELECT * FROM users;'
    sql_params = []

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    users = []

    result_set.each do |record|
      user = User.new 
      user.id = record["id"]
      user.email = record["email"]
      user.name = record["name"]
      user.username = record["username"]
      user.password = record["password"]

      users << user 
    end 

    return users

  end

  def find(id)

    sql = 'SELECT * FROM users WHERE id = $1;'
    sql_params = [id]

    result = DatabaseConnection.exec_params(sql, sql_params)

    record = result[0]

    user = User.new 
    user.id = record["id"]
    user.email = record["email"]
    user.name = record["name"]
    user.username = record["username"]
    user.password = record["password"]

    return user 
  end

  def create(new_user)
    
    sql = 'INSERT INTO users (email, name, username, password) VALUES ($1, $2, $3, $4);'
    sql_params = [new_user.email, new_user.name, new_user.username, new_user.password]

    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end

end