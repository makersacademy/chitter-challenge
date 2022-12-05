require_relative 'peep'
require_relative 'database_connection'

class PeepRepository
	def all
		peeps = []

		# Send the SQL query and get the result set.
		sql = 'SELECT id, username, comment, time FROM peeps;'
		result_set = DatabaseConnection.exec_params(sql, [])
		
		# The result set is an array of hashes.
		# Loop through it to create a model
		# object for each record hash.
		result_set.each do |record|

			# Create a new model object
			# with the record data.
			peep = Peep.new
			peep.id = record['id'].to_i
			peep.username = record['username']
			peep.comment = record['comment']
			peep.time = record['time']

			peeps << peep
		end
		return peeps
	end


	def create(peep)
    sql = 'INSERT INTO peeps (username, comment, time) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [peep.username, peep.comment, peep.time])

    return peep
  end
end