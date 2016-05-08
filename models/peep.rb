class Peep

	include DataMapper::Resource

	property :id, Serial
	property :content, String
	property :created_at, DateTime
	property :reply_to, Integer

	belongs_to :user, required: false
	has n, :replies, self,
		parent_key: [:id],
		child_key: [:reply_to]

	def created_at_formatted
		created_at.strftime("%H:%M, %A %-d %b %Y")
	end

end