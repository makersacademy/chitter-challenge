class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :user, String
  property :email, String
  property :password, String

  def self.add(args)
    User.create(args) if User.unique?(args[:user], args[:email])
  end

  def self.unique?(user, email)
    User.unique_user?(user) && User.unique_email?(email)
  end

  def self.unique_user?(user)
    !User.all.map { |entry| entry.user }.include?(user)
  end

  def self.unique_email?(email)
    !User.all.map { |entry| entry.email }.include?(email)
  end
end
