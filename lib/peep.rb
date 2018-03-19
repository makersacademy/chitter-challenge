require_relative './db_connection_setup.rb'

class Peep
  attr_reader :id, :ts, :txt

  def initialize(id, ts, txt)
    @id = id
    @ts = ts
    @txt = txt
  end

  def self.all
    result = DBconnection.query("SELECT * FROM peeps ORDER BY ts DESC")
    result.map { |peep| Peep.new(peep['id'], peep['ts'], peep['txt']) }
  end

  def self.create(time = Time.new.to_s.rpartition('')[0].to_s, message)
    DBconnection.query("INSERT INTO peeps (ts, txt) VALUES (
    '#{time}', '#{message[:txt]}')")
  end
end
