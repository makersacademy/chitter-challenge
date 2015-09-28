require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative '../data_mapper_setup'

module ChitterApp

  module Routes

    class Base < Sinatra::Base

      use Rack::MethodOverride

      register Sinatra::Flash
      register Sinatra::Partial

      enable :sessions, :static
      enable :partial_underscores

      set :session_secret, 'super secret'
      set :partial_template_engine, :erb

      set :views, proc { File.join(root, '..', 'views')}

      helpers do
        def current_user
          @current ||= User.first(id: session[:user_id])
        end
      end

    end

  end

end
