DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/chitter_development' )
DataMapper.finalize
DataMapper.auto_upgrade!
