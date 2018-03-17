require 'database_connection'

class Peep

  def initialize(id, text, time)
  end

  def self.setup(db_connect = DatabaseConnection)
    @con = db_connect
  end

  def self.all
    @con.query('SELECT * FROM peeps').map do |peep|
      Peep.new(peep['id'], peep['text'], peep['time'])
    end
  end
end
