require_relative "db_connection"

class User
  attr_reader :email, :id
  def self.create(email, pass)
    add_user = DbConnection.query("INSERT INTO users (email, pass) VALUES ('#{email}', '#{pass}');")
  end

  def self.find(email)
    find_user = DbConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    User.new(email: find_user[0]["email"], id: find_user[0]["id"])
  end

  def initialize(email:, id:)
    @email = email
    @id = id
  end
end
