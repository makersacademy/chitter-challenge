require 'pg'
class Peep
	def self.all
		connection = PG.connect(dbname: 'chitter')
		result = connection.exec("SELECT * FROM chitters;")
		result.map { |chitter| chitter['content'] }
	end
end 