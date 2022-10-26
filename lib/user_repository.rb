require_relative './user'
require_relative './database_connection'

class UserRepository
  def user_from_record(record)
    user = User.new
    user.id = record['id'].to_i
    user.email = record['email']
    user.password = record['password']
    user.name = record['name']
    user.username = record['username']
    user
  end

  def all
    sql_query = 'SELECT * FROM users;'
    sql_params = []
    result_set = DatabaseConnection.exec_params(sql_query, sql_params)

    result_set.map { |record| user_from_record(record) }
  end

  def find_by_id(id)
    sql_query = 'SELECT * FROM users WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql_query, sql_params)

    find_result = result_set.map { |record| user_from_record(record) }

    return nil if find_result.empty?

    find_result[0]
  end

  def find_by_email(email)
    sql_query = 'SELECT * FROM users WHERE email = $1;'
    sql_params = [email]

    result_set = DatabaseConnection.exec_params(sql_query, sql_params)

    find_result = result_set.map { |record| user_from_record(record) }

    return nil if find_result.empty?

    find_result[0]
  end

  def find_by_username(username)
    sql_query = 'SELECT * FROM users WHERE username = $1;'
    sql_params = [username]

    result_set = DatabaseConnection.exec_params(sql_query, sql_params)

    find_result = result_set.map { |record| user_from_record(record) }

    return nil if find_result.empty?

    find_result[0]
  end

  def create(user)
    # Check email and username are unique
    if !find_by_email(user.email).nil? || !find_by_username(user.username).nil?
      raise 'Email address and/or username already in use'
    else
      sql_query = "INSERT INTO users \
                    (email, password, name, username) \
                    VALUES \
                    ($1, $2, $3, $4);"
      sql_params = [user.email, user.password, user.name, user.username]

      DatabaseConnection.exec_params(sql_query, sql_params)
    end
  end
end
