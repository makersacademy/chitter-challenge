require 'data_mapper'
require 'dm-postgres-adapter'

class Reply
  include DataMapper::Resource

  belongs_to :peep
  belongs_to :user

  property :id, Serial
  property :content, Text, required: true
  property :created_at, DateTime, required: true

  def self.create_and_return_replys(content: content,
                                    created_at: created_at,
                                    user: user,
                                    peep: peep)
    if Reply.create(content: content, created_at: created_at, user: user, peep: peep)
      peep.replys << peep
      Reply.all(peep_id: peep.id).reverse
    end
    []
  end

  def self.peep_replys_in_reverse(peep_id)
    replys = Reply.all(peep_id).reverse
    replys ? replys : []
  end
end
