require 'data_mapper'

  class User
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :name,      String    # A varchar type string, for short strings
  property :handle,    String    # A varchar type string, for short strings
  property :created_at, DateTime  # A DateTime, for any date you might like.

  has n, :peeps
  
  def self.create_current_user
    @current_user = User.last
  end

  def self.current_user
    @current_user
  end
  end