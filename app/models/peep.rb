require 'dm-timestamps'
require_relative 'user'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :message, String
  property :created_at, DateTime

  belongs_to :source, 'Peep', :required => false

  def self.sort_time_rev(arr = self.all)
    arr.sort{|a,b| b.created_at <=> a.created_at}
  end
end
