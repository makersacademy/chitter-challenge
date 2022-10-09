require 'pg'

class User
  def self.all
    begin
      connection = PG.connect :dbname => 'chitter_test'
      result = connection.exec("SELECT * FROM users;")
      result.map do |row|
        row
        new(id: row["id"],
            email: row["email"],
            username: row["username"],
            fullname: row["fullname"],
            password: row["password"]
        )
      end
    rescue PG::Error => e
      puts e.message
    ensure
      connection.close if connection
    end
  end

  def self.create(email:, username:, fullname:, password:)
    begin
      connection = PG.connect :dbname => 'chitter_test'
      connection.exec("INSERT INTO users (email, username, fullname, password) VALUES('#{email}', '#{username}', '#{fullname}', '#{password}')")
    rescue PG::Error => e
      puts e.message
    ensure
      connection.close if connection
    end
  end

  attr_reader :id, :email, :username, :fullname, :password
  def initialize(id:, email:, username:, fullname:, password:)
    @id = id
    @email = email
    @username = username
    @fullname = fullname
    @password = password
  end

end