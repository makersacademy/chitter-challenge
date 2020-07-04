require 'pg'

class Peep
  def self.all
    # [
    #   "Hello this is a peep",
    #   "also a peep",
    #   "another peep"
    #  ]
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chitter;")
    result.map { |peep| peep['peeps'] }
  end
end
