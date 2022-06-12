require 'pg'

class Peep
  def self.post
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
   end
    result = connection.exec("SELECT * FROM chitter;")
    result.map { |peep| peep['peep'] }
  end

  def self.new(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
   end
    connection.exec("INSERT INTO chitter (peep) VALUES('#{peep}')")
  end

  

end