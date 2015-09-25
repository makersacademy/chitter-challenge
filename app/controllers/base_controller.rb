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

        def random_token
          random_token = Array.new(10).map { (65 + rand(58)).chr }.join
          random_token.hash
        end
      end

    end

  end

end
