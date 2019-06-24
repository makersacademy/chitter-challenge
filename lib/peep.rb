require 'pg'

class Peep

  def self.all

    if ENV['RACK_ENV'] == 'test'
     connection = PG.connect(dbname: 'chitter_test')
     else
     connection = PG.connect(dbname: 'Chitter')
    end
     result = connection.exec("SELECT * FROM peeps;")
     peep = result.map do
     |peep_entry| peep_entry['peep']
     end
     # date = result.map do
     #   |peep_entry| peep_entry['created_at']
     # end
     return peep

  end

  def self.create(peep:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end

    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end

end
