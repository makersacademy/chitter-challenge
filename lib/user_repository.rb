require_relative "user"

class UserRepository
  def all
    sql = "SELECT * FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])

    map_records_to_user_objects(result_set)
  end

  def find_by_email(email)
    sql = "SELECT * FROM users WHERE email = $1;"
    result_set = DatabaseConnection.exec_params(sql, [email])

    raise "This email does not exist in the database." if result_set.to_a.empty?

    map_records_to_user_objects(result_set)[0]
  end

  def find_by_id(user_id)
    sql = "SELECT * FROM users WHERE user_id = $1;"
    result_set = DatabaseConnection.exec_params(sql, [user_id])

    map_records_to_user_objects(result_set)[0]
  end

  def create(user)
    sql = "INSERT INTO users (first_name, last_name, email, username, password) VALUES ($1, $2, $3, $4, crypt($5, gen_salt('bf', 8)));"
    result_set = DatabaseConnection.exec_params(sql, [user.first_name, user.last_name, user.email, user.username, user.password])

    user
  end

  def authenticate?(email, password)
    sql = "SELECT * FROM users WHERE email = $1 AND password = crypt($2, password);"
    result_set = DatabaseConnection.exec_params(sql, [email, password])

    result_set.to_a.empty? ? false : true
  end

  private

  def map_records_to_user_objects(records)
    users = []

    records.each do |record|
      user = User.new
      user.user_id = record["user_id"]
      user.first_name = record["first_name"]
      user.last_name = record["last_name"]
      user.email = record["email"]
      user.username = record["username"]
      user.password = record["password"]

      users << user
    end

    users
  end
end
