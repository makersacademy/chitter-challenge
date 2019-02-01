require 'pg'
require 'date'
require_relative 'db_connection'
require_relative 'db_setup'

class Peep

 def self.all
   query = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created DESC")
   @peeps = query.map { |eachquery| Peep.new(eachquery['message'], eachquery['created'], eachquery['userid'])}
 end

 def self.username(id)
   query = DatabaseConnection.query("SELECT username FROM users WHERE id = '#{id}'")
   query[0]['username']
 end

 def self.add(peep, id)
   time = Time.now.strftime("%d/%m/%Y at %H:%M:%S ")
   DatabaseConnection.query("INSERT INTO peeps (message, created, userID) VALUES('#{peep}', 'posted on #{time}', '#{id}')")
 end

attr_reader :message, :created, :userID

 def initialize(message, created, userID)
   @message = message
   @created = created
   @userID = userID
 end

end
