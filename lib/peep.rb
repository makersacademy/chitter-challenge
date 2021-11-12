require 'pg'

class Peep

	def self.all
		connection = PG.connect(dbname: "chitter")
		result = connection.exec("SELECT * FROM peeps;")
		result.map { |peep| peep['message'] }
	end

	def self.create(message)
		connection = PG.connect(dbname: "chitter")
		connection.exec_params("INSERT INTO peeps (message) VALUES ($1);", [message])
	end

end