require 'pg'

class Chitter

  attr_reader :id, :peep

  def initalize(id, peep)
    @id = id
    @peep = peep
  end

  def ==(peep)
    @id == peep.id

  def self.all
    connection = PG.connect(dbname: 'chitter_site')

    result = connection.exec("SELECT * FROM chitter")
    result.map { |peep| chitter['peep'] }

  end

  def self.create(message)

    message[:peep]

    sql_query = "INSERT INTO chitter (peep) VALUES('#{message[:peep]}') RETURNING id, peep"

    connection = PG.connect(dbname: 'chitter_site')

    connection.exec("INSERT INTO chitter (peep) VALUES('#{peep}') RETURNING id, peep")
  end
end
