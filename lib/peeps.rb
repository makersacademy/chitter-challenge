require_relative "../database_connection.rb"
require_relative "./users.rb"

class Peep
  attr_reader :body, :username, :timestamp
  def initialize(body, username, timestamp)
    @body = body
    @username = username
    @timestamp = timestamp
  end
  def find_user
    User.find_user(@username)
  end
  def self.create(body, username)
    result = DatabaseConnection.query(("INSERT INTO peeps (body, username) VALUES('#{body}', '#{username}') RETURNING body, username, time_posted;"))
    Peep.new(result[0]['body'], result[0]['username'], result[0]['time_posted'])
  end
  def self.all
    result = DatabaseConnection.query("SELECT * FROM Peeps")
    peeps = result.map do |peep|
      Peep.new(peep['body'], peep['username'], peep['time_posted'])
    end
  end
  def self.reverse_time_peeps
    Peep.all.reverse
  end

end
