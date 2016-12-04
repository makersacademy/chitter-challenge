require 'data_mapper'
require 'dm-postgres-adapter'
require 'pry'

class Peep
  include DataMapper::Resource
  belongs_to :user


  property :id, Serial, required: true
  property :text, String, required: true

end
