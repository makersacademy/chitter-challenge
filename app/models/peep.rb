class Peep
	include DataMapper::Resource

property :id, Serial
property :peep_content, String, :length => 140
property :created_at, DateTime

belongs_to :user

end