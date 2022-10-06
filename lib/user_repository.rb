require_relative 'user'

class UserRepository
  def all
    users = []
    sql = "SELECT id, #{user_details} FROM users;"
    records = DatabaseConnection.exec_params(sql, [])
    records.each do |record|
      users << record_to_user_object(record)
    end

    return users
  end

  # def peeps_by_user    # <<------- This should work as a join, but not sure how to link it in.
  #   users = []
  #   sql = "SELECT users.username, peeps.user_id FROM users JOIN peeps ON peeps.user_id = users.id"
  #   records = DatabaseConnection.exec_params(sql, [])
  #   records.each do |record|
  #     users << record_to_user_object(record)
  #   end

  #   return users
  # end

  def create(user)
    sql = "INSERT INTO users (#{user_details}) VALUES ($1, $2, $3, $4, $5);"
    sql_params = [user.first_name, user.last_name, user.username, user.email, user.password]
    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end

  def find(id)
    sql = "SELECT id, #{user_details} FROM users WHERE id = $1;"
    records = DatabaseConnection.exec_params(sql, [id])
    record_to_user_object(records[0])
  end

  private

  def record_to_user_object(record)
    user = User.new
    user.id = record['id'].to_i
    user.first_name = record['first_name']
    user.last_name = record['last_name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']

    user
  end

  def user_details
    'first_name, last_name, username, email, password'
  end
end