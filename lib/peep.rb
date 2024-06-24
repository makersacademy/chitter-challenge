
require 'pg'

class Peep

attr_reader :peep
  
def initialize(peep)
  @peep = peep
end

def self.all
  connection = PG.connect(dbname: 'chitter')
  result = connection.exec("SELECT * FROM chitter;") #DESC?
  result.map do |peep|
  Peep.new(peep: peep["peep"])
   end
  end

def self.create(peep)
  connection = PG.connect(dbname: 'chitter')
  result = connection.exec("INSERT INTO chitter (peep) VALUES('#{peep}') RETURNING id, peep;")
  Peep.new(peep: result[0]["peep"])
end

end
#(peep) after 'create method'
#id: result[0]["id"],