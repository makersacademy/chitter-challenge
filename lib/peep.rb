require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chit_test')
    else
      connection = PG.connect(dbname: 'chit')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['content'] }
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chit_test')
    else
      connection = PG.connect(dbname: 'chit')
    end
  
    connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")
  end
end
