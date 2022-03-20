require_relative './database_manager'
require_relative './user'

class UserManager
  def add(new_user)
    name = new_user['name']
    email = new_user['email']
    password = new_user['password']
    username = new_user['username']
    sql_query = [
      "INSERT INTO users (email, password, name, username)",
      "VALUES ($1, $2, $3, $4)",
      "RETURNING id, email, password, name, username, created"
    ].join(' ')
    return_new_user(@db_manager.query(sql_query, email, password, name, username))
  end

  def self.instance
    @manager ||= UserManager.new
  end

  private

  def return_new_user(response)
    new_user = "No New User"
    response.each do |row|
      new_user = create_user(row)
    end
    return new_user
  end

  def reset_users_array
    @users = []
  end

  def create_user(row)
    User.new(
      id: row['id'],
      name: row['name'],
      email: row['email'],
      password: row['password'],
      username: row['username'],
      created: row['created']
    )
  end

  def initialize(db_manager = DatabaseManager)
    @db_manager = db_manager
    reset_users_array
  end
end
