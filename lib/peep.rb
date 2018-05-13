require 'pg'

class Peep

attr_reader :id, :string

def initialize(id = id, string = string)
  @id = id
  @string = string
end

def self.add(string)
  result = self.database.exec( "INSERT INTO peeps (string) VALUES('#{string}') RETURNING string" )
  Peep.new(result.first['string'])
end

def self.all
  result = self.database.exec("SELECT * FROM peeps")
  result.map { |peep| Peep.new(peep['id'], peep['string']) }.reverse
end

def self.database
  ENV['RACK'] == 'test' ?
  PG.connect(dbname: 'peep_manager_test') : PG.connect(dbname: 'peep_manager')
end


end
