require 'pg'

class Peep

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname:'chitter_db')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['content'] }
  end

end
