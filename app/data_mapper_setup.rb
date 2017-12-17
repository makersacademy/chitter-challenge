DataMapper.setup(:default, "postgres://localhost/chitter_manager_#{ENV['RACK_ENV']}")
DataMapper::Model.raise_on_save_failure = true
DataMapper.finalize
DataMapper.auto_upgrade!
