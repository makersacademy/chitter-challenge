require 'dm-timestamps'
require_relative 'user'
class Peep

    include DataMapper::Resource

    has n, :users, through: Resource

    property :id, Serial
    property :content, Text, :length => 500000
    property :created_at, Time

end
