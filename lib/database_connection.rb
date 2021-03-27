require 'pg'

class DatabaseConnection
	def self.setup(database_name)
 		@@database = PG.connect(dbname: database_name)
 	end

	def self.query(query_string)
 		@@database.exec(query_string)
 	end
end
