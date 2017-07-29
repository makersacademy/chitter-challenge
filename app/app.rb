ENV['RACK_ENV'] ||= 'development'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require 'sinatra/flash'
require 'erb'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
