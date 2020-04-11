require_relative './db_connection'
require_relative './maker'

class Peep
  attr_reader :id, :text, :time, :maker

  def initialize(id, text, time, maker)
    @id = id
    @text = text
    @time = time
    @maker = maker
  end

  def self.all
    DBConnection.connect
    result = DBConnection.run_query("SELECT * FROM peeps;")
    DBConnection.disconnect
    result.map { |row| Peep.new(row['id'], row['text'], row['time'], row['maker_id']) }
  end

  def self.create(text, time, maker_id = 4)
    DBConnection.connect
    result = DBConnection.run_query("INSERT INTO peeps (text, time) VALUES ($$#{text}$$, $$#{time}$$) RETURNING id, text, time;")
    DBConnection.disconnect

    maker = Maker.find_by_id(maker_id)
    Peep.new(result[0]['id'], result[0]['text'], result[0]['time'], maker)
  end
end
