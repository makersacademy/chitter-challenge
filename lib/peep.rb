require 'pg'

class Peep
  attr_reader :id, :text, :time

  def initialize(id, text, time)
    @id = id
    @text = text
    @time = time
  end

  def self.all
    database = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    conn = PG.connect(dbname: database)
    result = conn.exec("SELECT * FROM peeps;")
    conn.close
    result.map { |row| Peep.new(row['id'], row['text'], row['time']) }
  end

  def self.create(text, time)
    database = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    conn = PG.connect(dbname: database)
    result = conn.exec("INSERT INTO peeps (text, time) VALUES ($$#{text}$$, $$#{time}$$) RETURNING id, text, time;")
    conn.close
    Peep.new(result[0]['id'], result[0]['text'], result[0]['time'])
  end
end
