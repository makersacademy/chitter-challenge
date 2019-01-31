require 'pg'
require 'date'
require_relative 'db_connection'
require_relative 'db_setup'

class Peep

 def self.all
   query = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created DESC")
   @peeps = query.map { |eachquery| Peep.new(eachquery['message'], eachquery['created'])}
 end

 def self.add(peep)
   time = Time.now.strftime("%H:%M:%S - %d/%m/%Y")
   DatabaseConnection.query("INSERT INTO peeps (message, created) VALUES('#{peep}', '#{time}')")
 end

attr_reader :message, :created

 def initialize(message, created)
   @message = message
   @created = created
 end

end
