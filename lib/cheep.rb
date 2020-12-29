require 'pg'

class Cheep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'cheeps_test_database')
    else
      connection = PG.connect(dbname: 'cheeps')
    end

    result = connection.exec("SELECT * FROM cheeps;")
    result.map { |cheep| cheep['message'] }
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'cheeps_test_database')
    else
      connection = PG.connect(dbname: 'cheeps')
    end
  
    connection.exec("INSERT INTO cheeps (message) VALUES('#{message}')")
  end

end
