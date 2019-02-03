require 'pg'

class Cheet
  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    cheets = connection.exec("SELECT * FROM cheets;")
    cheets.map { |row| row['cheet'] }
  end
end
