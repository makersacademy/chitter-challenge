class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  use Rack::MethodOverride

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end
end
