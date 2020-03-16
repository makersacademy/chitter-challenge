require 'pg'
require_relative 'new_peep'
class Peep

  def self.posted_peeps
     connection = PG.connect(dbname: 'chitter')

     if ENV['ENVIROMENT'] == 'test'
       connection = PG.connect(dbname: 'chitter_test')
     else
       connection = PG.connect(dbname: 'chitter')
     end

     result = connection.exec("SELECT * FROM peeps")
     result.map do |peep|
       peep["body"]
     end
  end


# new method create_peep to add peeps to the database.

  def self.create_peep(peep:)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (body) VALUES('#{peep}') RETURNING id, body;")
    NewPeep.new(id: result[0]['id'], peep: result[0]['body'])
  end
end
