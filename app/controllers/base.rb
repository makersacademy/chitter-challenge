require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative '../data_mapper_setup'

module BeefBurgers
  module Routes
    class Base < Sinatra::Base
      set :views, proc { File.join(root, '..', 'views')}
      enable :sessions
      register Sinatra::Flash
      use Rack::MethodOverride

      helpers do
        def current_user
          @current_user ||= User.get(session[:user_id]) if session[:user_id]  
        end
      end

    end
  end
end