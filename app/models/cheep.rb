class Cheep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :content, Text
  property :time, DateTime

  def user
    User.get(self.user_id).username
  end

end
