require_relative './users.rb'

class UserRepository
  
  def all
    users = []

    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.map do |user|
      new_user = Users.new
      new_user.id = user['id'].to_i
      new_user.name = user['name']
      new_user.username = user['username']
      new_user.email = user['email']
      new_user.password = user['password']

      users.push(new_user)
    end

    return users
  end

  def find(id)
    sql = 'SELECT id, name, email FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    user = Users.new
    user.id = result_set[0]['id'].to_i
    user.name = result_set[0]['name']
    user.email = result_set[0]['email']

    return user
  end

  def find_by_email(email)
    sql = 'SELECT id, name, email FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])

    if result_set.to_a.empty?
      return nil
    else
      params = result_set[0]
      user = Users.new
      user.id = params['id']
      user.name = params['name']
      user.email = params['email']
      user.username = params['username']
      user.password = params['password']

      return user
    end
    

  end

  def create(user)
    sql = 'INSERT INTO users (name, email, username, password) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [user.name, user.email, user.username, user.password])

    return user
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end

end

testing = UserRepository.new

testing.find_by_email('joe.bloggs@test.com')