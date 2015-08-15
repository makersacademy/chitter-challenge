module ChitterApp
  module Routes
    class Base < Sinatra::Base
      register Sinatra::Flash
      use Rack::MethodOverride
      set :views, proc { File.join(root, '..', 'views') }

      enable :sessions
      set :session_secret, 'Very Secret'

      get '/' do
        flash.now[:notice]
        erb :homepage
      end

      helpers do
        def current_user
          User.get(session[:user_id])
        end
      end
    end
  end
end
