require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

require 'bcrypt'

def require_all(dir)
  Dir[File.dirname(__FILE__) + "/#{dir}/*.rb"].each { |file| require file }
end

require_all 'models'
DataMapper.setup(
  :default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
)

DataMapper.finalize
DataMapper.auto_upgrade!

require_all 'lib'
require_all 'actions'
