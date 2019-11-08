class Post
	attr_reader :post, :poster, :time

	def initialize(post, poster, time)
		@post = post
		@poster = poster
		@time = time
	end

	def self.convert_to_post(data)
		new_data = []
		title = nil
		poster = nil
		time = nil

		data.each do |key, value|
			if key == "post"
				post = value
			end
			if key == "poster"
				poster = value
				poster = true
			end
			if key == "time"
				time = value
			end
			new_data << Post.new(post, poster, time)	
		end

		return new_data
	end
end