require "pg"

class User

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    result = connect_to_db.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = connect_to_db.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.connect_to_db
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "message_manager_test")
    else
      connection = PG.connect(dbname: "message_manager")
    end
  end
end