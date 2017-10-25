# class Relationship
#   include DataMapper::Resource
#   property :user_id, Integer, :key => true
#   property :follower_id, Integer, :key => true
#   belongs_to :user, :child_key => [:user_id]
#   belongs_to :follower, :model => 'User', :child_key => [:follower_id]
# end
