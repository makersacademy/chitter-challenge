require './app/data_mapper_setup'
require 'sinatra'
require 'sinatra/flash'

module Application
  module Routes
    class Base < Sinatra::Base
      set :views, proc { File.join(root, '..', 'views') }
      enable :sessions
      register Sinatra::Flash

      helpers do
        def current_user
          @current_user ||= User.get(session[:user_id])
        end
      end
      #run! if app_file == $0

      #use Rack::MethodOverride

    end
  end
end
