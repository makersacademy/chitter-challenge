require 'pg'

class Peep 
	attr_reader :user, :time, :content
	
	def initialize(user, time, content)
		@user = user
		@time = time
		@content = content
	end
end