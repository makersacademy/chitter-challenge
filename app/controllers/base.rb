module Chitter

  module Routes

    class Base < Sinatra::Application

      set :views, proc { File.join(root, '../views') }
      set :partial_template_engine, :erb

      get '/' do
        erb :index
      end

      helpers do
        def current_user
          @current_user ||= User.get(session[:user_id]) if session[:user_id]
        end
      end

    end

  end

end


