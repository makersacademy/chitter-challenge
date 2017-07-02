class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end
  
end
