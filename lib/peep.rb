require 'pg'

class Peep

  def self.connect_to_database
   if ENV['ENVIRONMENT'] == 'test'
     @conn = PG.connect(dbname: 'chitter_db_test')
   else
     @conn = PG.connect(dbname: 'chitter_db')
   end
 end

 def self.all
   connect_to_database
   # Returns all peeps as a PG object
   query = @conn.exec ("SELECT * FROM peeps")
   # Iterates over PG and returns readable Peep object
   @peeps = query.map { |eachquery| Peep.new(eachquery['message'])}
 end

 def self.add(peep)
   connect_to_database
   @conn.exec ("INSERT INTO peeps (message) VALUES('#{peep}')")
 end

attr_reader :message

 def initialize(message)
   @message = message
 end

end
