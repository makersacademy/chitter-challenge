require 'data_mapper'
require_relative 'peep'
require_relative 'user'

class Reply
  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :date_time, DateTime

  belongs_to :peep
  belongs_to :user

end
