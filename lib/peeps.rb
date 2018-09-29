require 'pg'

class Peeps
  def self.all
    conn = PG.connect( dbname: ENV['DATABASE'])
    res = conn.exec("SELECT message, created_at FROM peeps")
    res.map do |peep| {
      msg: peep['message'],
      created_at: peep['created_at']
      }
    end
  end

  def self.add(msg)
    conn = PG.connect( dbname: ENV['DATABASE'])
    conn.exec("INSERT INTO peeps(message) VALUES('#{msg}')")
  end
end