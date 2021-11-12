class Peep

	@@peeps = []

	def self.all
		@@peeps
	end

	def self.create(message)
		@@peeps << message
	end

end