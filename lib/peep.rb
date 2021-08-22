# require 'pg' #the gem makes object avaialbe to ruby

# class Peep
#   def self.all
#     if ENV['ENVIRONMENT'] == 'test'
#     connection = PG.connect(dbname: 'chitter_test')
#     else
#     connection = PG.connect(dbname: 'chitter') #use PG to connect to database
#     end

#     result = connection.exec('SELECT * FROM peeps;') #can send query using exec to retrieve data
#     result.map { |status| p status['peep'] } #return only the peeps in this loop
#   end

#   def self.create(peep:)
#     if ENV['ENVIRONMENT'] == 'test'
#       connection = PG.connect(dbname: 'chitter_test')
#     else
#       connection = PG.connect(dbname: 'chitter_manager')
#     end
  
#     connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
#   end 

# end