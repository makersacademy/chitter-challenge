require_relative 'database_connection'
require 'time'

class Peep 

	attr_reader :id, :message, :time

	def initialize(id:, message:, time:)
		@id = id
		@message = message
		@time = time
		
	end

	def self.create(peep:)
		if ENV["ENVIRONMENT"] == 'test'
			DatabaseConnection.setup("chitter_test")
		else
			DatabaseConnection.setup("chitter")
		end
		time = Time.now.strftime("%d-%m-%y @%H:%M")
		result = DatabaseConnection.query(
			"INSERT INTO peeps (message, time) VALUES ($1, $2) RETURNING id, message, time;",
		 [peep, time]
		)

		Peep.new(
			id: result[0]['id'],
			message: result[0]['message'],
			time: result[0]['time'],
		)
	end

	def self.all
		if ENV["ENVIRONMENT"] == 'test'
			DatabaseConnection.setup("chitter_test")
		else
			DatabaseConnection.setup("chitter")
		end

		result = DatabaseConnection.query("SELECT * FROM peeps")

		result.map do |peep|
			Peep.new(
			id: peep['id'],
			message: peep['message'],
			time: peep['time']
		)
		end
	end

end

