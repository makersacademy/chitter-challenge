require_relative './user'

class UserRepository
  def all
    sql = 'SELECT id, name, username, email, password FROM users ORDER by id'
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []

    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.username = record['username']
      user.email = record['email']
      user.password = record['password']
      users << user
    end
    
    return users
  end
  
  def find(id)
    sql = 'SELECT id, name, username, email, password FROM users WHERE id = $1'
    result_set = DatabaseConnection.exec_params(sql, [id])
    result = result_set[0]

    user = User.new
    user.id = result['id'].to_i
    user.name = result['name']
    user.username = result['username']
    user.email = result['email']
    user.password = result['password']

    return user
  end

  def create(new_user)
    sql = 'INSERT INTO 
            users (name, username, email, password) 
            VALUES ($1, $2, $3, $4)'

    params = [
      new_user.name,
      new_user.username,
      new_user.email,
      new_user.password
    ]

    DatabaseConnection.exec_params(sql, params)
  end

  def update(id, col, val)  
    sql = 'UPDATE users SET name = $2 WHERE id = $1' if col == 'name' 
    sql = 'UPDATE users SET username = $2 WHERE id = $1' if col == 'username'
    sql = 'UPDATE users SET email = $2 WHERE id = $1' if col == 'email'
    sql = 'UPDATE users SET password = $2 WHERE id = $1' if col == 'password'
     
    params = [id, val]
    DatabaseConnection.exec_params(sql, params)
  end
end
