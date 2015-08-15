require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'
require './app/controllers/base'
require './app/controllers/user_controller'
require './app/controllers/session_controller'

module Armadillo
  class Chitter < Sinatra::Base
    register Sinatra::Flash
    enable :sessions
    set :session_secret, 'super secret'

    get '/' do
      erb :index
    end

    use Routes::UserController
    use Routes::Base
    use Routes::SessionController

    helpers do
      def current_user
        User.get(session[:user_id])
      end
    end

    run! if app_file == $0
  end
end