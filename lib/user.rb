require_relative './database_connection'

class User
  attr_reader :id, :email, :username, :full_name, :password

  def initialize(response_data)
    response_data = response_data.first

    @id = response_data["id"].to_i
    @email = response_data["email"]
    @username = response_data["username"]
    @full_name = response_data["full_name"]
    @password = response_data["password"]
  end

  def self.add_user(email:, username:, full_name:, password:)
    ## Class method inserts a new user record into the database; returns an instance of User class
    result = DatabaseConnection.query("INSERT INTO users (email, username, full_name, password) 
      VALUES ($1, $2, $3, $4)
      RETURNING id, email, username, full_name, password;",
      [email, username, full_name, password]
    )

    return User.new(result)
  end

  def self.find_user(credential, data)
    ## Class method queries database for a user based on a specified credential; returns false or an instance of User class
    result = DatabaseConnection.query("SELECT * FROM users WHERE #{credential}='#{data}';") # TODO: exec_params method ("sql", [params]) DOES NOT WORK for some reason. Fix this.
    return result.num_tuples.zero? ? false : User.new(result)
  end
  
end