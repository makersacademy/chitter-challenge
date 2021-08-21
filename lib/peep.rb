require 'pg'

class Peep

  attr_reader :id, :message

  def initialize(id = nil, message = "no message entered")
    @id = id
    @message = message
  end

  def self.all_peeps
    ["Im a peep!", "Im another different peep!"]
  end


  def create(message)
    con = database_connection
    result = con.exec_params("INSERT INTO peeps (message) VALUES ($1) RETURNING id, message;", [message])
    Peep.new(result[0]["id"], result[0]["message"])
  end

 
private

  def database_connection
    if ENV == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
  end

end


# peep = Peep.new
# peep.create('test')

