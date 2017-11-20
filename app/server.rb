class App < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  set :session_secret, 'narcissus'
  set :partial_template_engine, :erb
  enable :sessions
  enable :partial_underscores

  helpers do 
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def maxpeeps
      20
    end
  end
end
