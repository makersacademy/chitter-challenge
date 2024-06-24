require_relative './user'

class UserRepository
  def all
    users = []

    sql = "SELECT * FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      user = User.new
      user.id = record["id"].to_i
      user.name = record["name"]
      user.email = record["email"]
      user.username = record["username"]
      user.password = record["password"]

      users << user
    end
    return users
  end

  def find_by_email(email)
    sql = "SELECT * FROM users WHERE email = $1;"
    result_set = DatabaseConnection.exec_params(sql, [email])

    user = User.new
    user.id = result_set[0]["id"].to_i
    user.name = result_set[0]["name"]
    user.email = result_set[0]["email"]
    user.username = result_set[0]["username"]
    user.password = result_set[0]["password"]

    return user
  end

  def find(id)
    sql = "SELECT id, name, email, username, password FROM users WHERE id = $1;"
    result_set = DatabaseConnection.exec_params(sql, [id])

    user = User.new
    user.id = result_set[0]["id"].to_i
    user.name = result_set[0]["name"]
    user.email = result_set[0]["email"]
    user.username = result_set[0]["username"]
    user.password = result_set[0]["password"]

    return user
  end

  def create(user)
    sql =
      "INSERT INTO users (name, email, username, password) VALUES ($1, $2, $3, $4);"
    result_set =
      DatabaseConnection.exec_params(
        sql,
        [user.name, user.email, user.username, user.password],
      )

    return user
  end
end
