require_all 'models'

DataMapper.setup(
  :default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
)

DataMapper.finalize
DataMapper.auto_upgrade!
