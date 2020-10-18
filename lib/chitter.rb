require 'pg'
class Chitter

attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep=peep

  end

def self.all
  if ENV['ENVIRONMENT']=='test'
    connection=PG.connect(dbname: 'chitterdbtest')
  else
    connection=PG.connect(dbname: 'chitterdb')
  end
  result=connection.exec("SELECT * FROM chitter_table;")
  result.map{ |row| new(peep: row['peep'], id: row['id'] )}

end



def self.create(peep:)
  if ENV['ENVIRONMENT']=='test'
    connection=PG.connect(dbname: 'chitterdbtest')
  else
    connection=PG.connect(dbname: 'chitterdb')
  end
result=connection.exec("INSERT INTO chitter_table (peep) VALUES('#{peep}') RETURNING id, peep; ")
Chitter.new(id:result[0]['id'], peep: result[0]['peep'])
end
end
