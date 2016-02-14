require 'data_mapper'

class Peep
  include DataMapper::Resource

property :id, Serial
property :text, String
property :time, String
property :username, String
property :parent, Integer

has n, :users, :through => Resource

end
