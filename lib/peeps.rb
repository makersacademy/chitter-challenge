require 'pg'

class Peeps 

  def self.all
    connection = PG.connect(dbname: 'chitter_manager')
    result = connection.exec('SELECT * FROM peeps;')
    result.map { | peep | peep['message_content'] }
  end


end