require "bcrypt"
require_relative "./user"
require_relative "./user_repository"

class UserRepository
  def all
    sql = "SELECT id, user_name, name, email, password FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])
    list_of_all_users = []

    result_set.each do |user|
      users = User.new
      users.id = user["id"]
      users.user_name = user["user_name"]
      users.name = user["name"]
      users.email = user["email"]
      users.password = user["password"]

      list_of_all_users << users
    end

    return list_of_all_users
  end

  def create(new_user)
    encrypted_password = BCrypt::Password.create(new_user.password)
    sql = "INSERT INTO users (user_name, name, email, password) VALUES ($1,$2,$3,$4);"
    sql_params = [new_user.user_name, new_user.name, new_user.email, encrypted_password]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def find(id)
    sql = "SELECT id,user_name,name,email,password FROM users WHERE id = $1;"
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]

    user_in_question = User.new
    user_in_question.id = record["id"].to_i
    user_in_question.user_name = record["user_name"]
    user_in_question.name = record["name"]
    user_in_question.email = record["email"]
    user_in_question.password = record["password"]

    return user_in_question
  end

  def find_by_email(email)
    sql = "SELECT * FROM users WHERE email = $1;"
    result_set = DatabaseConnection.exec_params(sql, [email])
    result_set = result_set[0]

    user = User.new
    user.id = result_set["id"].to_i
    user.name = result_set["name"]
    user.user_name = result_set["user_name"]
    user.email = result_set["email"]
    user.password = result_set["password"]

    return user
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?

    if submitted_password == BCrypt::Password.new(user.password)
      return redirect ("/")
    else
      return erb(:login)
    end
  end
end
