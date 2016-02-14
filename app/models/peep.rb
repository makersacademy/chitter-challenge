require 'data_mapper'

class Peep
  include DataMapper::Resource

property :id, Serial
property :text, String
property :time, String
property :username, String

has n, :users, :through => Resource

end
