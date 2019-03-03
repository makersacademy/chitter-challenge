require_relative 'database_connection'

class Peep

  def self.all
    Database_Connection.querry("SELECT * FROM peeps")
  end

  def initialize(peep)
    Database_Connection.querry("INSERT INTO peeps(peep) VALUES('#{peep}')")
  end
end
