require 'pg'

class Bottle

  attr_reader :id, :userid, :body, :created

  def initialize(id, userid, body, created)
    @id = id
    @userid = userid
    @body = body
    @created = created
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bottles JOIN users ON users.id=userid ORDER BY created DESC;")
    result.map { |bottle|
      Bottle.new(bottle["id"], bottle["username"], bottle["body"], bottle["created"])
    }
  end

  def self.post(user, message, time)
    result = DatabaseConnection.query("INSERT INTO bottles (userid, body, created) 
              VALUES ('#{user}', '#{message}', '#{time}');")
  end
end