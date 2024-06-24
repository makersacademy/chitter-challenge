require 'pg'

class Peep
  attr_reader :content, :time, :username

  def initialize(content:, time:, username:)
    @content = content
    @time = time
    @username = username
  end

  def self.feed
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    rs = con.exec("SELECT * FROM peeps ORDER BY timestamp DESC LIMIT 300 OFFSET 0;")
    rs.map do |row|
      Peep.new(content: row['content'], time: row['timestamp'], username: row['username'])
    end
  end

  def self.send(content:, time:, username:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    rs = con.exec_params("INSERT INTO peeps (timestamp, content, username) VALUES ($1, $2, $3) RETURNING timestamp, content, username", [time, content, username])
  end
end