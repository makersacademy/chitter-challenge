class Peep
  include DataMapper::Resource

  belongs_to :user, required: true

  property :id, Serial
  property :message, String
  property :created_at, DateTime

  def peeper_username
     User.get(user_id).username
  end

end
