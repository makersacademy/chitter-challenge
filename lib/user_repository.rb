require_relative "user"

class UserRepository
  def all
    sql = "SELECT * FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])

    users = map_records_to_user_objects(result_set)
  end

  def find_by_email(email)
    sql = "SELECT * FROM users WHERE email = $1;"
    result_set = DatabaseConnection.exec_params(sql, [email])

    user = map_records_to_user_objects(result_set)[0]

    user
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
