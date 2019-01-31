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
   peepspg = @conn.exec ("SELECT * FROM peeps")
   # Iterates over PG and returns readable Hashs
   @peeps = []
   peepspg.each {|eachpeep| @peeps << eachpeep }
   @peeps
 end

 def self.add(peep)
   connect_to_database
   @conn.exec ("INSERT INTO peeps (message) VALUES('#{peep}')")
 end
end
