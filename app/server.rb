class ChitterChallenge < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
