require_relative './database_connection'

class User

  def self.setup(db_connect = DatabaseConnection)
    @con = db_connect
  end

  def self.sign_in(email, password)
    @con.query("SELECT * FROM users WHERE email=#{email}")
  end

end
