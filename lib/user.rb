class User
  attr_reader :name, :lastname, :username, :email, :id

  def initialize(name, lastname, username, email, password)
    connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
    insertion = connection.exec("INSERT INTO users (name, lastname, username, email, password) VALUES('#{name}', '#{lastname}', '#{username}', '#{email}', '#{password}') RETURNING id, name, lastname, username, email, password")

    @id = insertion.first['id']
    @name = insertion.first['name']
    @lastname = insertion.first['lastname']
    @username = insertion.first['username']
    @email = insertion.first['email']
    @password = insertion.first['password']
  end
end
