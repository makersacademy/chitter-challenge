require 'pg'

class Peep


  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['message']}
  end

  def self.create(message:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
  connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
end
end
