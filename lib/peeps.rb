require 'pg'

class Peeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 

    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['message'] }
  end

  def self.post(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}');")
  end
end
