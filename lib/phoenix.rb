require './lib/db_connection_setup.rb'

class Phoenix
  attr_reader :id, :phoenix, :summoner, :timestamp

  def initialize(id, phoenix, summoner, timestamp)
    @id = id
    @phoenix = phoenix
    @summoner = summoner
    @timestamp = timestamp
  end

  def self.all
    @all = []
    @result = DB_Connection.query('SELECT * FROM summons ORDER BY id DESC')
    @result.map { |fenix| @all << Phoenix.new(fenix['id'], fenix['phoenix'], fenix['summoner'], fenix['timestamp']) }
    @all
  end

  def self.summon(phoenix_text)
    DB_Connection.query("INSERT INTO summons (phoenix, summoner, timestamp) VALUES ('#{phoenix_text}', 'julesnuggy', current_timestamp(0));")
  end

end
