require 'pg'
require 'bcrypt'

class Registration

  def self.register(email:, password:)
    hidden_password = BCrypt::Password.create(password)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{hidden_password}');")
  end

end
