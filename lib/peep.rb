require 'pg'

class Peep
  def self.all
    # [
    #   "my first peep",
    #   "my second peep",
    #   "my third peep"
    #  ]
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_data_test')
    else
      connection = PG.connect(dbname: 'peep_data')
    end
    connection = PG.connect(dbname: 'peep_data')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['text'] }
  end
end
