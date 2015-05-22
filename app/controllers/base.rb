module Chitter
  module Routes
    class Base < Sinatra::Application
      set :views, Proc.new { File.join(root, '../views') }
      set :partial_template_engine, :erb

      helpers do
        def current_user
          @current_user ||= User.get(session[:user_id]) if session[:user_id]
        end
      end

    end
  end
end
