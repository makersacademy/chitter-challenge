require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative 'controllers/cheeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  set :views, File.dirname(__FILE__) + '/views'

  enable :sessions

  get '/' do
    erb :'cheeps/welcome'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
