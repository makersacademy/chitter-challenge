require_relative './user'

class UserRepository
  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT * FROM users;'
    result = DatabaseConnection.exec_params(sql, [])

    users = []

    result.each do |record|
      users << create_user_object_from_table(record)
    end

    return users
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params).first
    return create_user_object_from_table(result)
  end

  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (username, name, email, password) VALUES ($1, $2, $3, $4);
  end

  # def update(user)
  # end

  # def delete(user)
  # end

  private

  def create_user_object_from_table(record)
    user = User.new
    user.id = record['id'].to_i
    user.username = record['username']
    user.name = record['name']
    user.email = record['email']
    user.password = record['password']
    return user
  end
    
end
