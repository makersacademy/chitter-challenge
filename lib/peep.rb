require 'pg'
require 'time'

class Peep

  def self.create(username:, content:)
    time = Time.now
    query = "INSERT INTO peeps (peep_time, username, content) VALUES('#{time}', '#{username}', '#{content}') RETURNING peep_id;"
    result = DatabaseConnection.query(query)
    peep_id = result[0]["peep_id"]
    Peep.new(id: peep_id, time: time, username: username, content: content)
  end

  def self.all
    query = "SELECT * FROM peeps;"
    rows = DatabaseConnection.query(query)
    rows.map do |row|
      Peep.new(id: row["id"], time: Time.parse(row["peep_time"]), username: row["username"], content: row["content"])
    end
  end

  attr_reader :id, :time, :username, :content
  def initialize(id:, time:, username:, content:)
    @id, @username, @content = id, username, content
    @time = time.strftime("%H:%M")
  end

end
