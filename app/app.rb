ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'rest_client'
require_relative 'dm_setup'
require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/peeps'


class ChitterApp < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end




  # start the server if ruby file executed directly
  run! if app_file == $0
end
