require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter')
    connection.exec("SELECT * FROM peeps")
  end
end
