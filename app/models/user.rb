class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String

end

DataMapper::Logger.new(File.dirname(File.absolute_path(__FILE__))+'/log.txt', :debug)
DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
