require 'pg'
require_relative 'user'
require_relative 'database_connection'

class Peep
  attr_reader :id, :userid, :timestamp, :content, :threadpeep

  def initialize(id:, userid:, timestamp:, content:, threadpeep:)
    @id = id
    @userid = userid
    @timestamp = timestamp
    @content = content
    @threadpeep = threadpeep
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY timestamp \
      DESC")
    result.map do |peep|
      Peep.new(id: peep['id'], userid: peep['userid'], \
        timestamp: peep['timestamp'], content: peep['content'], \
        threadpeep: peep['threadpeep'])
    end
  end

  def self.create(userid:, timestamp:, content:, threadpeep:)
    result = DatabaseConnection.query("INSERT INTO peeps (userid, timestamp, \
      content, threadpeep) VALUES ('#{userid}', '#{timestamp}', '#{content}', \
        '#{threadpeep}') RETURNING id, userid, timestamp, content, \
        threadpeep;")
    Peep.new(id: result[0]['id'], userid: result[0]['userid'], \
      timestamp: result[0]['timestamp'], content: result[0]['content'], \
      threadpeep: result[0]['threadpeep'])
  end
end
