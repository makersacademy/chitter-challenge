
class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secretpass'

  register Sinatra::Flash

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  use Rack::MethodOverride

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  # run if file is run directly by Ruby
  run! if app_file == $0

end
