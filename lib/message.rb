require 'pg'
class Message

  attr_reader :body, :name, :username, :id, :time
  
  def initialize(body:, name:, username:, time:, id:)
    @body = body
    @name = name
    @username = username
    @time = time
    @id = id
  end

  def self.post(body:, name:, username:)
    if ENV['DB_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    result = con.exec_params('INSERT INTO messages (body, name, username, created_at) VALUES ($1 ,$2, $3, NOW()) RETURNING body, name, username, created_at, id;', [body, name, username])
    Message.new(body: result[0]['body'], name: result[0]['name'], username: result[0]['username'], time: result[0]['created_at'], id: result[0]['id'])
  end

  def self.all
    messages = []
    if ENV['DB_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    result = con.exec_params('SELECT *, EXTRACT(YEAR FROM created_at) "year", EXTRACT(MONTH FROM created_at) "month", EXTRACT(DAY FROM created_at) "day", EXTRACT(HOUR FROM created_at) "hour", EXTRACT(MINUTE FROM created_at) "minute" FROM messages ORDER BY created_at DESC;')

    result.each do |row|
      messages << Message.new(body: row['body'], name: row['name'], username: row['username'], time: Time.new(row['year'], row['month'], row['day'], row['hour'], row['minute']), id: row['id'])
    end
    messages
  end
end