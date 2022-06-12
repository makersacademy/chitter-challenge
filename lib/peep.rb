require 'pg'

class Peep

  def self.all

    connection = PG.connect(dbname: 'chitter_chatter')
    result = connection.exec("SELECT * FROM peeps;")
    peeps = result.map { |peep| peep['content'] }
    peeps.reverse
  end

end