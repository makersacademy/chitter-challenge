class Chitter < Sinatra::Base

  use Rack::MethodOverride
  
  enable :sessions
  set :session_secret, 'super secret'
  
  register Sinatra::Flash
  register Sinatra::Partial
  
  # The order of set and enable matters !
  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    erb :index
  end

  helpers do
    # returns an instance of User for the currently logged-in user
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end