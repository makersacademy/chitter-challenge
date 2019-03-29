require 'pg'

class Chitter
  def self.all
    connection = PG.connect(dbname: 'chitter_app')
    result = connection.exec("SELECT * FROM chitter;")
    result.map { |peep| peep['content']}
  end
end
