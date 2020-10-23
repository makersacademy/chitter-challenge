require 'pg'


class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter' ) 
    peeps = connection.exec ("SELECT * FROM peeps;") 
    peeps.map { |peep| 
    p peep
    peep["peep"] }
  end
end