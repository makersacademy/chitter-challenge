require_relative "./user"

class UserRepository
  def initialize
  end

  def all 
    query = 'SELECT * FROM users;'
    users = []
    result_set = DatabaseConnection.exec_params(query, [])
    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.username = record['username']
      user.name = record['name']
      user.surname = record['surname']
      user.email = record['email']
      user.pass = record['pass']
      user.posts_amount = record['posts_amount'].to_i
      users << user
    end
    return users
  end

  def find(id) 
    raise "id must be an Integer" unless id.class == Integer
    query = 'SELECT * FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(query, [id])
    user = User.new
    user.id = result_set[0]['id'].to_i
    user.username = result_set[0]['username']
    user.name = result_set[0]['name']
    user.surname = result_set[0]['surname']
    user.email = result_set[0]['email']
    user.pass = result_set[0]['pass']
    user.posts_amount = result_set[0]['posts_amount'].to_i
    return [user]
  end

  def create(user) # user is an instance of the User class
    query = 'INSERT INTO users (username, name, surname, email, pass, posts_amount) VALUES ($1, $2, $3, $4, $5, $6);'
    sql_params = [user.username, user.name, user.surname, user.email, user.pass, user.posts_amount]
    DatabaseConnection.exec_params(query, sql_params)
    return nil
  end

  def delete(id) 
    query = 'DELETE FROM users WHERE id = $1;'
    DatabaseConnection.exec_params(query, [id])
    return nil
  end

  def update_username(user)
    query = 'UPDATE users SET username = $1 WHERE id = $2;'
    DatabaseConnection.exec_params(query, [user.username, user.id])
    return nil
  end

  def update_name(user)
    query = 'UPDATE users SET name = $1 WHERE id = $2;'
    DatabaseConnection.exec_params(query, [user.name, user.id])
    return nil
  end

  def update_surname(user)
    query = 'UPDATE users SET surname = $1 WHERE id = $2;'
    DatabaseConnection.exec_params(query, [user.surname, user.id])
    return nil
  end

  def update_email(user)
    query = 'UPDATE users SET email = $1 WHERE id = $2;'
    DatabaseConnection.exec_params(query, [user.email, user.id])
    return nil
  end

  def update_pass(user)
    query = 'UPDATE users SET pass = $1 WHERE id = $2;'
    DatabaseConnection.exec_params(query, [user.pass, user.id])
    return nil
  end
end