require 'pg'

class Bottle

  attr_reader :id, :name, :username, :body, :created

  def initialize(id, name, username, body, created)
    @id = id
    @name = name
    @username = username
    @body = body
    @created = created
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bottles 
       JOIN users ON users.id=userid ORDER BY created DESC;")
    result.map { |bottle|
      Bottle.new(bottle["id"], bottle["name"], bottle["username"], bottle["body"],
                 bottle["created"])
    }
  end

  def self.post(user, message, time = Time.now)
    user_id = DatabaseConnection.query("SELECT id FROM users WHERE username = '#{user}';") 
    DatabaseConnection.query("INSERT INTO bottles (userid, body, created)
              VALUES (#{user_id[0]['id']}, '#{message}', '#{time}');")
  end
end
