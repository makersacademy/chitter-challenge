require_relative "db_connection"

class User
  attr_reader :email
  def self.create(email, pass)
    add_user = DbConnection.query("INSERT INTO users (email, pass) VALUES ('#{email}', '#{pass}');")
  end

  def self.find(email)
    find_user = DbConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    User.new(email: find_user[0]["email"], pass: find_user[0]["pass"])
  end

  def initialize(email:, pass:)
    @email = email
    @pass = pass
  end
end
