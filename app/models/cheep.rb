class Cheep

include DataMapper::Resource

property :id, Serial
property :cheep, String
property :time, DateTime

belongs_to :user

end
