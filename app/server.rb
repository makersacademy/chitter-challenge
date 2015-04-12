require 'sinatra/base'
require 'data_mapper'
require 'bcrypt'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/lib/user'
require './app/lib/peep'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

    set :views, proc { File.join(root, '..', 'views') }
  
  get '/' do
    "Hello, Chitter!"
 end
 
  run! if app_file == Chitter
end
