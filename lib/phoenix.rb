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

  def self.find(id)
    @result = DB_Connection.query("SELECT * FROM summons WHERE id = #{id}")
    @result.map { |fenix| Phoenix.new(fenix['id'], fenix['phoenix'], fenix['summoner'], fenix['timestamp']) }.first
  end

  def self.summon(phoenix_text, summoner = 'guest_user')
    phoenix_text = phoenix_text.gsub(/\'/, "\'\'")
    DB_Connection.query("INSERT INTO summons (phoenix, summoner, timestamp) VALUES ('#{phoenix_text}', '#{summoner}', current_timestamp(0));")
  end

  def self.reraise(id, new_text)
    new_text = new_text.gsub(/\'/, "\'\'")
    DB_Connection.query("UPDATE summons SET phoenix = '#{new_text}', timestamp = CONCAT('edited: ', current_timestamp(0)) WHERE id = #{id};")
  end

  def self.dismiss(id)
    DB_Connection.query("DELETE FROM summons WHERE id = #{id};")
  end

end
