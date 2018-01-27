require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  # Give the class some database-interaction superpowers
  include DataMapper::Resource

  # Tell the class which columns exist in the student table
  property :id,     Serial
  property :content,   Text
  property :created_at, DateTime

  def self.display_in_reverse_order
      self.all(order: :created_at.desc)
    end


end
