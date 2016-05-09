require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource


  property :id, Serial
  property :content, String
  property :time, DateTime

  def username
    User.get(self.user_id).username
  end

  belongs_to :user

end
