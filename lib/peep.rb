require 'pg'
require './lib/database'

class Peep

attr_reader :id, :string, :time

def initialize(id = id, string = string, time = Time.now.asctime)
  @id = id
  @string = string
  @time = time
end

def ==(other)
  (self.id == other.id)
end

def self.add(string, time = Time.now.asctime)
  result = Database.query( "INSERT INTO peeps (string, time) VALUES('#{string}', '#{time}') RETURNING id, string, time" )
  Peep.new(result.first['id'], result.first['string'], result.first['time'])
end

def self.all
  result = Database.query("SELECT * FROM peeps")
  result.map { |peep| Peep.new(peep['id'], peep['string'], result['time']) }.reverse
end

def self.database
  ENV['RACK'] == 'test' ?
  PG.connect(dbname: 'peep_manager_test') : PG.connect(dbname: 'peep_manager')
end


end
