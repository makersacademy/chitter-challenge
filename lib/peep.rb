require_relative 'database_connection'

class Peep

  def self.all
    Database_Connection.querry("SELECT * FROM peeps ORDER BY time DESC")
  end

  def initialize(peep)
    Database_Connection.querry("INSERT INTO peeps VALUES(DEFAULT, '#{peep}', '#{Time::now}');")
  end
end
