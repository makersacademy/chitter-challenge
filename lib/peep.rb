require 'pg'
require 'time'

class Peep

  attr_reader :id, :message, :maker_id, :time

  def initialize(id, message, maker_id, timestamp)
    @id = id
    @message = message
    @maker_id = maker_id
    @time = Time.parse(timestamp)
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end

    table = conn.exec("SELECT * FROM peeps")
    table.map { |peep| Peep.new(peep['id'], peep['message'], peep['maker_id'], peep['timestamp']) }
  end

  def self.create(message, maker_id)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    result = conn.exec("INSERT INTO peeps (message, maker_id, timestamp) VALUES('#{message}', '#{maker_id}', '#{Time.now}') RETURNING id, message, maker_id, timestamp")
    Peep.new(result[0]['id'], result[0]['message'], result[0]['maker_id'], result[0]['timestamp'])
  end

end
