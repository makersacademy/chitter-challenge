require 'data_mapper'

class CommentMessage
  include DataMapper::Resource

  belongs_to :comment,   :key => true
  belongs_to :message, :key => true

end