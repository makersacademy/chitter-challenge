require 'pg'
require_relative './database.rb'

class User

  def self.add(username, name, email, password)
    Database.exec("INSERT INTO users(username, name, email, password)
    VALUES('#{username}', '#{name}', '#{email}', '#{password}')
    RETURNING id, username, name;")
  end

end
