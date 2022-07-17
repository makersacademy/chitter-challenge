require_relative "user"

class UserRepository
  def all
    users = []

    sql = "SELECT * FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
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
