require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :name, :username, :post, :time, :id

  def initialize(id:, name:, username:, post:, time:)
    @id = id
    @name = name
    @username = username
    @post = post
    @time = time
  end

  def self.all
    result = DatabaseConnection.query( "SELECT * FROM peeps ORDER BY time DESC" )
    result.map { |peep| Peep.new(id: peep['id'], name: peep['name'], username: peep['username'], post: peep['post'], time: peep['time']) }
  end

  def self.post(name:, username:, post:)
    result = DatabaseConnection.query("INSERT INTO peeps (name, username, post) VALUES ('#{name}', '#{username}', '#{post}') RETURNING id, name, username, post;")
    Peep.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], post: result[0]['post'], time: result[0]['time'])
  end

end
