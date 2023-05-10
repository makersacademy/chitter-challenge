require_relative 'user'
require_relative 'peep'
require_relative 'database_connection'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []
    result_set.each do |record|
      users << record_to_user_object(record)
    end

    return users
  end

  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    user = record_to_user_object(result_set[0])

    return user
  end

  def create(user)
    fail "email already exists" if email_taken?(user.email)
    fail "username already exists" if username_taken?(user.username)

    sql = 'INSERT INTO users (email, password, name, username)
          VALUES ($1, $2, $3, $4);'
    params = [user.email, user.password,
      user.name, user.username]

    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  def find_with_peeps(id)
    sql = 'SELECT users.id, users.email,
              users.password, users.name,
              users.username,
              peeps.id AS peep_id,
              peeps.content, peeps.time
              FROM users JOIN peeps
              ON peeps.user_id = users.id
              WHERE users.id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    user = record_to_user_object(result_set[0])

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['peep_id'].to_i
      peep.content = record['content']
      peep.time = record['time']
      user.peeps << peep
    end

    return user
  end

  private

  def record_to_user_object(record)
    user = User.new
    user.id = record['id'].to_i
    user.email = record['email']
    user.password = record['password']
    user.name = record['name']
    user.username = record['username']
    return user
  end

  def email_taken?(email)
    used_emails = all.map { |user| user.email }
    return used_emails.include?(email)
  end

  def username_taken?(username)
    used_usernames = all.map { |user| user.username }
    return used_usernames.include?(username)
  end
end
