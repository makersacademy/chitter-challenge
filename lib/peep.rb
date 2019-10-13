require 'pg'

class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")

    result.map do |peep|
     peep['text']
    end
    # ["This is Peep 1", "This is Peep 2"]
  end

end
