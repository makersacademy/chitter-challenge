require 'pg'

class Peep

	def self.all
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: "chitter_test")
		else
			connection = PG.connect(dbname: "chitter")
		end
		result = connection.exec("SELECT * FROM peeps;")
		result.map { |peep| peep['message'] }
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