require 'pg'

class Peep
  attr_reader :content, :time

  def initialize(content:, time:)
    @content = content
    @time = time
  end

  def self.feed
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    rs = con.exec("SELECT * FROM peeps ORDER BY timestamp DESC LIMIT 300 OFFSET 0;")
    rs.map do |row|
      Peep.new(content: row['content'], time: row['timestamp'])
    end
  end

  def self.send(content:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    rs = con.exec_params("INSERT INTO peeps (timestamp, content) VALUES ($1, $2) RETURNING timestamp, content", [time, content])
  end
end