class Peep

include DataMapper::Resource

belongs_to :user

property :id, Serial
property :message, String, length: 140
property :time, String

end
