class Peep

include DataMapper::Resource

property :id, Serial
property :content, Text
property :author, Text
property :created_at, DateTime


end