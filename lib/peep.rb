require 'pg'
require './lib/db_connection.rb'

class Peep
  attr_accessor :id, :username, :content, :timestamp
  def initialize(id:, username:, content:, timestamp:)
    @id = id
    @username = username
    @content = content
    @timestamp = timestamp
  end

  def self.add(user_id:, content:)
    DatabaseConnection.new.run_query("INSERT INTO peeps (id, peep_content, timestamp, user_id) VALUES(DEFAULT, '#{content}', '#{Time.now}', '#{user_id}')")
  end

  def self.all
    peeps = []
    DatabaseConnection.new.run_query("SELECT * FROM peeps LEFT OUTER JOIN users ON peeps.user_id = users.id ORDER BY timestamp desc").each do |row|
      peeps << Peep.new(id: row["id"], username: row["username"], content: row["peep_content"], timestamp: row["timestamp"])
    end
    peeps
  end
end
