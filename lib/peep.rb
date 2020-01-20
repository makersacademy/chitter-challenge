require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    peeps = connection.exec("SELECT * FROM peeps;")
    peeps.map { |peep| peep['message'] }
  end
end
