ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require './app/models/data_mapper_setup'

require './app/server'
require './app/controllers/sessions'
require './app/controllers/users'
require './app/controllers/peeps'

require './lib/signup_error_handler'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'Schubert'
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
