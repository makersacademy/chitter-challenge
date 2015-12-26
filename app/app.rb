ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'tilt/erb'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :public_folder, 'public'

  get '/' do
    'Hello'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
