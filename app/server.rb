class App < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  enable :sessions
  enable :partial_underscores
  set :session_secret, 'narcissus'

  helpers do 
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
