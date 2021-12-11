require_relative 'database_connection'
require 'time'

class Peep 

	attr_reader :id, :message

	def initialize(id:, message:)
		@id = id
		@message = message
	end

	def self.create(peep:)
		if ENV["ENVIRONMENT"] == 'test'
			DatabaseConnection.setup("chitter_test")
		else
			DatabaseConnection.setup("chitter")
		end
		result = DatabaseConnection.query(
			"INSERT INTO peeps (message) VALUES ($1) RETURNING id, message;",
		 [peep]
		)

		Peep.new(
			id: result[0]['id'],
			message: result[0]['message']
		)
	end

	def self.all
		if ENV["ENVIRONMENT"] == 'test'
			DatabaseConnection.setup("chitter_test")
		else
			DatabaseConnection.setup("chitter")
		end

		result = DatabaseConnection.query("SELECT * FROM peeps")

		result.map do |message|
			Peep.new(
			id: message['id'],
			message: message['message'],
		)
		end
	end


end