require 'pg'

class Peep
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
    con.exec("ORDER BY date DESC, timestamp DESC")
  end

  def self.send(content:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    result = con.exec_params("INSERT INTO peeps (timestamp, content) VALUES ($1, $2) RETURNING timestamp, content", [time, content])
  end
end