DataMapper.setup(:default, 'postgres://localhost/chitter_development' )
DataMapper.finalize
DataMapper.auto_upgrade!
