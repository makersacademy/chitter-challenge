require 'pg'
require 'active_support/all'
require_relative './user'

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
		result= result.map do |pp| 
			Peep.new(pp['id'], pp['message'], pp['time'], pp['userid'])
		end
		result.reverse
	end

	def self.create(message, userid)
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: "chitter_test")
		else
			connection = PG.connect(dbname: "chitter")
		end
		time = Time.now
		query = "INSERT INTO peeps (message, time, UserID) VALUES ($1, $2, $3);"
		connection.exec_params(query, [message, time, userid.to_i])
	end

	def author(peep_id)
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: "chitter_test")
		else
			connection = PG.connect(dbname: "chitter")
		end
		result = connection.exec_params(
			"SELECT username FROM users WHERE id in 
			(SELECT UserID from peeps WHERE UserID=$1)",
			[peep_id]
			)
		result.first['username']
	end
	
end
