require 'data_mapper'
require 'dm-postgres-adapter'

class Reply
  include DataMapper::Resource

  belongs_to :peep
  belongs_to :user

  property :id, Serial
  property :content, Text, required: true
  property :created_at, DateTime, required: true

  def self.create_and_return_replys(content,
                                    time,
                                    current_user,
                                    peep)
    if Reply.create(content, time, current_user, peep)
      peep.replys << reply
      Reply.all(peep.id).reverse
    end
    []
  end

  def self.peep_replys_in_reverse(peep_id)
    replys = Reply.all(peep_id).reverse
    replys ? replys : []
  end
end
