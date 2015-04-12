env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chiter_#{env}")
DataMapper.finalize
