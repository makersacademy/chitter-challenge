require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :id, :username, :body, :posted_on

  def initialize(id:, username:, body:, posted_on:)
    @id = id
    @username = username
    @body = body 
    @posted_on = posted_on
  end

  def self.find_by(id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id=#{id.to_i};")
    result.map do |peep|
      Peep.new(
        id: peep['id'], 
        username: peep['username'], 
        body: peep['body'], 
        posted_on: peep['posted_on']
      )
    end.first
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(
        id: peep['id'], 
        username: peep['username'], 
        body: peep['body'], 
        posted_on: peep['posted_on']
      )
    end
  end

  def self.create(username:, body:)
    DatabaseConnection.query("INSERT INTO peeps (username, body, posted_on) 
    VALUES ('#{username}', '#{body}', '#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}');")
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id=#{id.to_i};")
  end

  def self.update(id:, body:)
    DatabaseConnection.query("UPDATE peeps SET body='#{body}' WHERE id=#{id.to_i};")
  end

end
