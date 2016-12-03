require 'data_mapper'

def data_mapper_settings

  # DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!

end
