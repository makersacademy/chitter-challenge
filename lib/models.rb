require_relative 'user'
require_relative 'message'

DataMapper.finalize
DataMapper.auto_migrate!
