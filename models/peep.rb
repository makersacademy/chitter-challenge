require 'pg'

class Peep

  def self.all_peeps
    connection = PG.connect(dbname: 'chitter_app')
    result = connection.exec("SELECT * FROM peep_messages;")
    result.map { |peep| peep['message'] }
  end


end