require_relative './user'

class UserRepository

  def all
    sql = 'SELECT id, name, email, password, username FROM users;'
    result_set = DatabaseConnection.exec_params(sql,[])

    users = []
    result_set.each do |record|
      users << record_to_user_object(record)
    end

    return users
  end

  def find(id)
    sql = 'SELECT id, name, email, password, username FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    record = result_set[0]
    return record_to_user_object(record)
  end

      # Insert new user 
    # item is a new User object
  def create(user)
    # Executes the SQL query:

    # INSERT INTO users (name, email, password, username) VALUES($1, $2, $3, $4);
    # Doesn't need to return anything (only creates a record)
  end

  private

  def record_to_user_object(record)
    user = User.new
    user.id = record["id"].to_i
    user.name = record["name"]
    user.email = record["email"]
    user.password = record["password"]
    user.username = record["username"]

    return user
  end
end
