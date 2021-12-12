require './lib/database_connection'

class SignUp

  attr_reader :email, :user_name, :handle

  def initialize(id:, email:, password:, user_name:, handle:)
    @id = id
    @email = email
    @password = password
    @user_name = user_name
    @handle = handle
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM sign_up;")
    result.map do |user_info|
      SignUp.new(id: user_info['id'], email: user_info['email'], password: user_info['password'], user_name: user_info['user_name'], handle: user_info['handle'])
    end
  end

  def self.create(email:, password:, user_name:, handle:)
    result = DatabaseConnection.query("INSERT INTO sign_up(email, password, user_name, handle) VALUES ($1, $2, $3, $4) RETURNING email, password, user_name, handle;", [email, password, user_name, handle])
    SignUp.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'], user_name: result[0]['user_name'], handle: result[0]['handle'])
  end

  def self.log_in_verified?(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM sign_up WHERE email = $1 AND password = $2;", [email, password])
    result.count.zero? ? false : true
  end

  def self.find_user_name(email:)
    result = DatabaseConnection.query("SELECT * FROM sign_up WHERE email = $1;", [email])
    result[0]['user_name']
  end

end
