env = ENV['RACK_ENV'] || 'development'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.auto_upgrade!

DataMapper.finalize