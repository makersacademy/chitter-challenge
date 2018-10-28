require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :name, :username, :post, :time, :id, :user_id

  def initialize(id:, name:, username:, post:, time:, user_id:)
    @id = id
    @name = name
    @username = username
    @post = post
    @time = time
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query( "SELECT * FROM peeps ORDER BY time DESC" )
    result.map { |peep| Peep.new(id: peep['id'], name: peep['name'], username: peep['username'], post: peep['post'], time: peep['time'], user_id: peep['user_id']) }
  end

  def self.post(post:, user_id:)
    user = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{user_id}';")
    result = User.new(id: user[0]['id'], email: user[0]['email'], username: user[0]['username'], name: user[0]['name'])
    result2 = DatabaseConnection.query("INSERT INTO peeps (name, username, post, user_id) VALUES ('#{user[0]['name']}', '#{user[0]['username']}', '#{post}', '#{user_id}') RETURNING id, name, username, post, user_id;")
    Peep.new(id: result2[0]['id'], name: result2[0]['name'], username: result2[0]['username'], post: result2[0]['post'], time: result2[0]['time'], user_id: result2[0]['user_id'])

  end

end
