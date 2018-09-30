class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :user, String
  property :email, String
  property :password, String

  def self.add(args)
    User.create(args) unless User.exists?(args[:user], args[:email])
  end

  def self.login(username, password)
    return unless User.exists_username?(username)
    user = User.first(user: username)
    @logged_in_user = user if user.password == password
  end

  def self.logout
    @logged_in_user = nil
  end

  def self.instance
    @logged_in_user
  end

  def self.exists?(username, email)
    User.exists_username?(username) || User.exists_email?(email)
  end

  def self.exists_username?(username)
    User.all.map { |entry| entry.user }.include?(username)
  end

  def self.exists_email?(email)
    User.all.map { |entry| entry.email }.include?(email)
  end
end
