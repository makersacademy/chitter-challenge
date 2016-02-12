require_relative 'models/user'

DataMapper.setup(:default, "postgres://localhost/chitter-#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!




########## Rakefile Auto_upgrade NOT working



