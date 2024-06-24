require_relative 'user'

class UserRepository

  # Selecting all records
  # No arguments
  def all
    all_users = []
    sql = 'SELECT id, name, username, email_address, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |user|
      all_users.push(record_to_user_object(user))
    end
    return all_users
  end

  def find(id)
    sql = 'SELECT id, name, username, email_address, password FROM users WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    user = result_set[0]

    return record_to_user_object(user)
  end

  def create(new_user)
    sql = 'INSERT INTO users (name, username, email_address, password) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [new_user.name, new_user.username, new_user.email_address, new_user.password])

    return new_user
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id]);

    return nil
  end

  private

  def record_to_user_object(record)
    user = User.new

    user.id = record['id'].to_i
    user.name = record['name']
    user.username = record['username']
    user.email_address = record['email_address']
    user.password = record['password']

    return user
  end
end
