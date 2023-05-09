require_relative './user'

class UserRepository

  def all
    query = 'SELECT * FROM users;'
    result = DatabaseConnection.exec_params(query, [])

    users = []

    result.each do |record|
      users << create_user_object(record)
    end

    return users
  end

  def find(id)
    query = 'SELECT * FROM users WHERE id = $1;'
    param = [id]

    result = DatabaseConnection.exec_params(query, param)[0]

    return create_user_object(result)
  end

  def create(user)
    query = 'INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4);'
    params = [user.email, user.password, user.name, user.username]

    DatabaseConnection.exec_params(query, params)
  end

  private 

  def create_user_object(record)
    user = User.new
    user.id = record['id']
    user.email = record['email']
    user.password = record['password']
    user.name = record['name']
    user.username = record['username']

    return user
  end
end
