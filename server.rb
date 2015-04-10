require 'sinatra/base'
require 'data_mapper'
require 'bcrypt'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/Chitter_#{env}")

require './lib/user'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  get '/' do
    'Hello, Chitter'
  end

  run! if app_file == Chitter

end

require_relative 'controllers/users'