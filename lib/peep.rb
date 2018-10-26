require 'pg'
require 'time'

class Peep

  def self.create(username:, content:)
    time = Time.now
    query = "INSERT INTO peeps (time, username, content) VALUES('#{time}', '#{username}', '#{content}') RETURNING id;"
    result = DatabaseConnection.query(query)
    id = result[0]["id"]
    Peep.new(id: id, time: time, username: username, content: content)
  end

  def self.all
    query = "SELECT * FROM peeps ORDER BY time DESC;"
    rows = DatabaseConnection.query(query)
    rows.map do |row|
      Peep.new(id: row["id"], time: Time.parse(row["time"]), username: row["username"], content: row["content"])
    end
  end

  def self.find(id)
    query = "SELECT * FROM peeps WHERE id = '#{id}'"
    result = DatabaseConnection.query(query).first
    Peep.new(id: result["id"], time: Time.parse(result["time"]), username: result["username"], content: result["content"])
  end

  def self.change(id, new_content)
    query = "UPDATE peeps SET content = '#{new_content}' WHERE id = '#{id}';"
    DatabaseConnection.query(query)
  end

  def self.delete(id)
    query = "DELETE FROM peeps WHERE id = '#{id}';"
    DatabaseConnection.query(query)
  end

  attr_reader :id, :time, :username, :content
  def initialize(id:, time:, username:, content:)
    @id, @username, @content = id, username, content
    @time = time.strftime("%H:%M")
  end

end
