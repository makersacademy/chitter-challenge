require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :content, :name, :username, :timestamp

  def initialize(id:, content:, name:, username:, timestamp:)
    @id = id
    @content = content
    @name = name
    @username = username
    @timestamp = timestamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        content: peep['content'],
        name: peep['name'],
        username: peep['username'],
        timestamp: peep['timestamp']
      )
    end
  end

  def self.create(name:, username:, content:)
    timestamp = "#{Time.now.strftime("%k:%M")} - #{Time.now.strftime("%d/%m/%Y")}"
    result = DatabaseConnection.query(
      "INSERT INTO peeps (name, username, content, timestamp)
      VALUES ($1, $2, $3, $4) RETURNING id, name, username, content, timestamp;",
      [name, username, content, timestamp]
    )
    Peep.new(
      id: result[0]['id'],
      content: result[0]['content'],
      name: result[0]['name'],
      username: result[0]['username'],
      timestamp: result[0]['timestamp']
    )
  end

end
