require 'data_mapper'
require_relative 'maker'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :maker_name, String
  property :maker_username, String
  property :content, Text

  belongs_to :maker

end
