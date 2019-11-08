class Post
	attr_reader :post, :poster, :time

	def initialize(post, poster, time)
		@post = post
		@poster = poster
		@time = time
	end

	def self.convert_to_post(data)
		new_data = [] 
		
		data.each do |key, value|
			p value
			if key == "post"
				post = value
			elsif key == "poster"
				poster = value
			elsif key == "time"
				time = value
			end
			new_data << Post.new(post, poster, time)	
		end

		return new_data
	end
end