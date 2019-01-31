require 'pg'
require 'date'

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
   query = @conn.exec ("SELECT * FROM peeps ORDER BY created DESC")
   # Iterates over PG and returns readable Peep object
   @peeps = query.map { |eachquery| Peep.new(eachquery['message'], eachquery['created'])}
 end

 def self.add(peep)
   connect_to_database
   time = Time.now.strftime("%H:%M:%S - %d/%m/%Y")
   @conn.exec ("INSERT INTO peeps (message, created) VALUES('#{peep}', '#{time}')")
 end

attr_reader :message, :created

 def initialize(message, created)
   @message = message
   @created = created
 end

 def time_created
   time = Time.now
   time = time.strftime("%H:%M:%S - %d/%m/%Y")
 end

end
