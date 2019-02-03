require 'data_mapper'
require_relative 'peep'

class Maker
  include DataMapper::Resource

  has n, :peeps

  property :id,           Serial, :key => true
  property :displayname,  String, :default => 'Default Account'
  property :username,     String, :default => 'default username'
  property :email,        String, :default => 'makers@makers.com'
  property :password,     String, :default => 'secret'

  def self.current_user=(maker)
    @current_user = maker
  end

  def self.current_user
    @current_user
  end

end
