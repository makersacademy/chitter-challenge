require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'dm-validations'

class Post
  include DataMapper::Resource

  property :id,         Serial
  property :post,       Text, :length => 1..140
  property :user_id,    String
  property :created_at, DateTime

  belongs_to :user

  def self.all_sorted_by_time
    all.sort_by(&:created_at).reverse!
  end

  def self.filtered_sorted_by_time(user_id)
    all(user_id).sort_by(&:created_at).reverse!
  end
end
