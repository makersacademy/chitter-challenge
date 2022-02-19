#as a user
#so that I can say what I'm feeling
#I want to post a peep from the web page to a database
require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_database')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['text']}
  end

end