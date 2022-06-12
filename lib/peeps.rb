# require 'pg'

# class Peeps
#   def self.all
#     connection = PG.connect(dbname: 'chitter')
#     connection.exec("SELECT * FROM peeps;")
#     result.map { |message| message['peep'] }
#   end
# end