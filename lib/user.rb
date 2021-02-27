class User
  attr_reader :name, :lastname, :username, :email
  def initialize(name, lastname, username, email, password)
    @name = name
    @lastname = lastname
    @username = username
    @email = email
    @password = password

    connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
    connection.exec("INSERT INTO users (name, lastname, username, email, password) VALUES('#{name}', '#{lastname}', '#{username}', '#{email}', '#{password}')") # RETURNING id, name, lastname, username, email, password")
    end

end
