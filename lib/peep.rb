# require 'pg' #the gem makes object avaialbe to ruby

# class Peep
#   attr_reader :peep, :time

#   def initialize(peep:, time:)
#     @peep = peep
#     @time = time
#   end

#   def self.all
#     if ENV['ENVIRONMENT'] == 'test'
#       connection = PG.connect(dbname: 'chitter_test')
#     else
#       connection = PG.connect(dbname: 'chitter') #use PG to connect to database
#     end

#     result = connection.exec('SELECT * FROM peeps;') #can send query using exec to retrieve data
#     result.map { |status| Peep.new(peep: status['peep'], time: status['time']) } #return only the peeps in this loop
#   end

#   def self.create(peep, time)

#     if ENV['ENVIRONMENT'] == 'test'
#       connection = PG.connect :dbname => 'chitter_test'
#     else
#       connection = PG.connect :dbname => 'chitter'
#     end
  
#     result = connection.exec("INSERT INTO peeps(peep, time) VALUES('#{peep}', '#{time}') RETURNING peep, time;")
#     Peep.new(peep: result[0]['peep'], time: result[0]['time'])
  
#   end 

# end