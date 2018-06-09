require 'pg'

class User

  attr_reader :id

  def initialize(id, username, email, password)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.save(options)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{options[:username]}', '#{options[:email]}', '#{options[:password]}') RETURNING id, username, email, password;")
    User.new(result[0]['id'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

end
