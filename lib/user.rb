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
    result = DatabaseConnection.query("INSERT INTO users (email, username, full_name, password) 
      VALUES ($1, $2, $3, $4)
      RETURNING id, email, username, full_name, password;",
      [email, username, full_name, password]
    )

    return User.new(result)
  end
end