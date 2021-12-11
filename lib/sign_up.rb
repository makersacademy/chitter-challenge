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
    p SignUp.new(email: result[0]['email'], password: result[0]['password'], user_name: result[0]['user_name'], handle: result[0]['handle'])
  end
end