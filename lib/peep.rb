require 'pg'
class Peep
	def self.all
		if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect(dbname: 'chitter_test')
		else
			connection = PG.connect(dbname: 'chitter')
		end 
		result = connection.exec("SELECT * FROM chitters;")
		result.map { |chitter| chitter['content'] }
	end

	def self.create(content:)
		if ENV["ENVIRONMENT"] == "test"
			connection = PG.connect(dbname: "chitter_test")
		else
			connection = PG.connect(dbname: "chitter")
		end
		connection.exec("INSERT INTO chitters (content) VALUES('#{content}')")
	end
end 