require 'pg'

class Peep
  def self.create(username:, body:)
    time_posted = Time.now

    query = "INSERT INTO peeps (username, body, time_posted) VALUES('#{username}', '#{body}', '#{time_posted}') RETURNING id, username, body, time_posted;"
    result = DatabaseConnection.query(query)
    Peep.new(username: result[0]['username'], body: result[0]['body'], time_posted: result[0]['time_posted'], id: result[0]['id'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(username: peep['username'], body: peep['body'], time_posted: peep['time_posted'], id: peep['id'])
    end
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id};")
    Peep.new(username: result[0]['username'], body: result[0]['body'], time_posted: result[0]['time_posted'], id: result[0]['id'])
  end

  def self.edit(id: ,body:)
    result = DatabaseConnection.query("UPDATE peeps SET body = '#{body}' WHERE id = #{id} RETURNING id, username, body, time_posted;")
    Peep.new(username: result[0]['username'], body: result[0]['body'], time_posted: result[0]['time_posted'], id: result[0]['id'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id};")
  end

  attr_reader :username, :body, :time_posted, :id
  
  def initialize(username:, body:, time_posted:, id:)
    @id = id
    @username = username
    @body = body
    @time_posted = time_posted
  end
end
