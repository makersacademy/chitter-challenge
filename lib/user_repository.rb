# file: lib/user_repository.rb
require_relative 'user'

class UserRepository

  def create(new_user)

    sql = '
      INSERT INTO users (email, name, username, password)
        VALUES($1, $2, $3, $4) RETURNING id;
    '
    sql_params = [
      new_user.email,
      new_user.name,
      new_user.username,
      new_user.password
    ]
    result = DatabaseConnection.exec_params(sql, sql_params)
    new_user.id = result.first['id'].to_i # convert to integer
    return new_user
  end

  def find(id)
    sql = "SELECT * FROM users WHERE id = $1"
    results = DatabaseConnection.exec_params(sql, [id])
    row = results.first
    user = User.new
    user.id = row['id'].to_i # convert to integer
    user.username = row['username']
    user.name = row['name']
    user.email = row['email']
    user.password = row['password']

    return user
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users where email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])
    
    user = User.new
    user.id = result_set[0]['id'].to_i
    user.email = result_set[0]['email']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.password = result_set[0]['password']

    return user
  end
end