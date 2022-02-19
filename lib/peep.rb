require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_database')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['text']}
  end

  def self.create(text:)

    connection = PG.connect(dbname: 'chitter_database')
    connection.exec("INSERT INTO peeps (text) VALUES('#{text}')")
  end

end