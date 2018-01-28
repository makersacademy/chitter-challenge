
class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :username, String, :unique_index => true
  property :email, Text, :unique_index => true
  property :password, Text

  validates_uniqueness_of :email
  validates_uniqueness_of :username

  def check_duplicates
    return "email" unless User.first(:email => email).nil?
    return "username" unless User.first(:username => username).nil?
  end
end

#:index=>true
