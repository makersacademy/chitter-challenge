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

  def self.create(opt)
    DBconnection.query("INSERT INTO peeps (txt) VALUES('#{opt[:txt]}')")
  end
end
