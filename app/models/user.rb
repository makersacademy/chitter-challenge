class User
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, Text

  def self.current_user(user_id)
    User.get(user_id)
  end
end
