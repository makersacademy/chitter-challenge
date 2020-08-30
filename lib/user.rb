require_relative "database"

class User

  def self.create(name, email, password)
    DataBase.query("INSERT INTO users (name,email,password) VALUES ('#{name}', '#{email}','#{password}') RETURNING id, name, email;")
  end

end