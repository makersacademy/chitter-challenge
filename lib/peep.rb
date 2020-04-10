require 'db_connection'

class Peep
  attr_reader :id, :text, :time

  def initialize(id, text, time)
    @id = id
    @text = text
    @time = time
  end

  def self.all
    DBConnection.connect
    result = DBConnection.run_query("SELECT * FROM peeps;")
    DBConnection.disconnect
    result.map { |row| Peep.new(row['id'], row['text'], row['time']) }
  end

  def self.create(text, time)
    DBConnection.connect
    result = DBConnection.run_query("INSERT INTO peeps (text, time) VALUES ($$#{text}$$, $$#{time}$$) RETURNING id, text, time;")
    DBConnection.disconnect
    Peep.new(result[0]['id'], result[0]['text'], result[0]['time'])
  end
end
