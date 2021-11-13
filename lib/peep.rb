require 'pg'

class Peep

	attr_reader :id, :message

	def initialize(id, message)
		@id = id
		@message = message
	end

	def self.all
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: "chitter_test")
		else
			connection = PG.connect(dbname: "chitter")
		end
		result = connection.exec("SELECT * FROM peeps;")
		result.map { |peep| Peep.new(peep['id'], peep['message']) }.reverse
	end

	def self.create(message)
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: "chitter_test")
		else
			connection = PG.connect(dbname: "chitter")
		end
		connection.exec_params("INSERT INTO peeps (message) VALUES ($1);", [message])
	end

end