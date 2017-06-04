class Message
	include DataMapper::Resource

	property :id, Serial
	property :text, Text
	property :time, String

	belongs_to :user

	def self.set_time
		time = Time.now.strftime("%H:%M:%S").to_s
	end	

end

