require 'pg'

class Peep
  def self.all
    con = PG.connect(dbname: 'chitter')
    result = con.exec('SELECT * FROM peeps')
  end
end