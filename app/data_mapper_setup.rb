env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/Chitter_#{env}")

DataMapper.finalize
