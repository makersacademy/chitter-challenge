require './lib/database_connection'

class SignUp

  attr_reader :email, :user_name, :handle

  def initialize(email:, password:, user_name:, handle:)
    @email = email
    @password = password
    @user_name = user_name
    @handle = handle
  end

  
  def self.create(email:, password:, user_name:, handle:)
    result = DatabaseConnection.query("INSERT INTO sign_up(email, password, user_name, handle) VALUES ($1, $2, $3, $4) RETURNING email, password, user_name, handle;", [email, password, user_name, handle])
    SignUp.new(email: result[0]['email'], password: result[0]['password'], user_name: result[0]['user_name'], handle: result[0]['handle'])
  end

  def self.log_in_verified?(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM sign_up WHERE email = $1 AND password = $2;", [email, password])
    if result.count == 0 
      false
    else
      true
    end
  end

  def self.find_user_name(email:)
    result = DatabaseConnection.query("SELECT * FROM sign_up WHERE email = $1;", [email])
    result[0]['user_name']
  end

end