DB_URL = "postgres://localhost/chitter_#{ENV['RACK_ENV']}".freeze
DataMapper.setup(:default, ENV['DATABASE_URL'] || DB_URL)
DataMapper.finalize
