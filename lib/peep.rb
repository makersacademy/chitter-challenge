require 'pg'
require 'active_support/all'

class Peep

	attr_reader :id, :message, :time, :userid

	def initialize(id, message, time, userid)
		@id = id
		@message = message
		@time = time
		@userid = userid
	end

	def self.all
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: "chitter_test")
		else
			connection = PG.connect(dbname: "chitter")
		end
		result = connection.exec("SELECT * FROM peeps;")
		result.map { |pp| Peep.new(pp['id'], pp['message'], pp['time'], pp['userid'].to_i) }.reverse
	end

	def self.create(message, userid)
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: "chitter_test")
		else
			connection = PG.connect(dbname: "chitter")
		end
		time = Time.now
		query = "INSERT INTO peeps (message, time, UserID) VALUES ($1, $2, $3);"
		connection.exec_params(query, [message, time, userid])
	end

end