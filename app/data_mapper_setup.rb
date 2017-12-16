DataMapper.setup(:default, "postgres://localhost/chitter_manager_#{ENV['RACK_ENV']}"  )
DataMapper.finalize
DataMapper.auto_upgrade!
