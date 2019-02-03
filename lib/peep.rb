require 'pg'

class Peep
  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    peeps = connection.exec("SELECT * FROM peeps;")
    peeps.map { |row| row['peep'] }
  end
end
