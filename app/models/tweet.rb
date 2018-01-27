require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Tweet
  include DataMapper::Resource

  property :id, Serial
  property :subject, String
  property :text, String
  property :created_at, Time
  property :created_by, String

  def self.all_in_reverse_order
    self.all(order: :created_at.desc)
  end

end
