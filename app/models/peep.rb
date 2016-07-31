#require_relative 'user'

class Peep
  include DataMapper::Resource

#  belongs_to :user, required: false

  property :id, Serial
  property :content, Text#, required: true
end
