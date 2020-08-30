require 'pg'


class Cheep
  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

   result = connection.exec("SELECT * FROM chitter;")
   result.map { |chitter| chitter['cheep'] }
  end
end