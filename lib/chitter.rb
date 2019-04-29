require 'pg'

class Chitter
  attr_reader :id, :peep
  def initialize(id:,peep:)
    @id = id
    @peep = peep
  end

def self.all
  connection = PG.connect(dbname: 'chitter')
  r = connection.exec("SELECT * FROM chitter;")
  r.map { |peep| peep['peep'] }
end

def self.create(peep:)
  connection = PG.connect(dbname: 'chitter')
  connection.exec("INSERT INTO chitter (peep) VALUES('#{peep}') RETURNING id, peep;")
end



end
