require 'rubygems'
require 'data_mapper'

class User
  attr_reader :id, :title, :body, :created_at

  include DataMapper::Resource
  # include DataMapper::Repository
  property :id,         Serial    # An auto-increment integer key
  property :email,      String    # A varchar type string, for short strings
  property :name,       String    # A text block, for longer string data.
  property :username,   String # A DateTime, for any date you might like.
  # DataMapper.finalize

  def self.sign_up(email, password, name, username)

  end

end
