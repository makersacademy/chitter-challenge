class Peep

include DataMapper::Resource

property :id, Serial
property :content, String
property :hashtag, Symbol

end