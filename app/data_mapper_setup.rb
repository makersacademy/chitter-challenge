env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
DataMapper.finalize