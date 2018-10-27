require 'pg'

class Peeps

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM chitter_test;")
    result.map { |peep| peep['peep'] }
  end

end
