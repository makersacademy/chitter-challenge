require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require './data_mapper_setup'
require './app/controllers/base'
require './app/controllers/cheets_controller'
require './app/controllers/sessions_controller'
require './app/controllers/user_controller'

module App

  class Chitter < Sinatra::Base

    get '/' do
      erb :'/index'
    end

    get '/welcome' do
      erb :'/welcome'
    end

    enable :sessions

    use Routes::Cheets_Controller
    use Routes::Sessions_Controller
    use Routes::User_Controller

    register Sinatra::Partial
    register Sinatra::Flash

    helpers do
      def current_user 
        current_user = User.get(session[:user_id])
      end
    end
  end
end
