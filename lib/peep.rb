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

  def self.all(maker_class = Maker)
    result = DBConnection.query("SELECT * FROM peeps ORDER BY time DESC;")
    result.map { |row| Peep.new(row['id'], row['text'], row['time'], maker_class.find_by_id(row['maker_id'])) }
  end

  def self.create(text, time, maker_id, maker_class = Maker)
    result = DBConnection.query("INSERT INTO peeps (text, time, maker_id) VALUES ($$#{text}$$, $$#{time}$$, $$#{maker_id}$$) RETURNING id, text, time;")
    maker = maker_class.find_by_id(maker_id)
    Peep.new(result[0]['id'], result[0]['text'], result[0]['time'], maker)
  end

  def self.find_by_id(id)
    result = DBConnection.query("SELECT * FROM peeps WHERE id=#{id};")
    Peep.new(result[0]['id'], result[0]['text'], result[0]['time'], Maker.find_by_id(result[0]['maker_id']))
  end
end
