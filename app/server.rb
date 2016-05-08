class ChitterChallenge < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end
  end
