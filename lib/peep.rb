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
   time = Time.now.strftime("%d/%m/%Y at %H:%M:%S ")
   DatabaseConnection.query("INSERT INTO peeps (message, created) VALUES('#{peep}', 'posted on #{time}')")
 end

attr_reader :message, :created

 def initialize(message, created)
   @message = message
   @created = created
 end

end
