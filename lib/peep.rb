require 'database_connection'

class Peep
  def self.setup(db_connect = DatabaseConnection)
    @con = db_connect
  end

  def self.all
    @con.query('SELECT * FROM peeps')
  end
end
