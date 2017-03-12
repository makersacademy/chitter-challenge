# def data_mapper_config
  DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV["RACK_ENV"]}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
# end
