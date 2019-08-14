require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'peeps_test')
    else
      connection = PG.connect( dbname: 'peeps')
    end
      result = connection.exec ("SELECT name, handle, peep FROM peeps;")
      result.map { |peep| peep['peep'] }
  end

end
