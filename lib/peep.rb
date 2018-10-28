require 'pg'
require 'database_connection'

class Peep

  attr_reader :name, :username, :post, :time

  def initialize(name:, username:, post:, time:)
    @name = name
    @username = username
    @post = post
    @time = time
  end

  def self.all
    result = DatabaseConnection.query( "SELECT * FROM peeps ORDER BY time DESC" )
    result.map { |peep| Peep.new(name: peep['name'], username: peep['username'], post: peep['post'], time: peep['time']) }
  end

  def self.post(name:, username:, post:)
    DatabaseConnection.query("INSERT INTO peeps (name, username, post) VALUES ('#{name}', '#{username}', '#{post}');")
  end

end
