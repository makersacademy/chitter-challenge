class Chitter < Sinatra::Base

  use Rack::MethodOverride

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial

  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores


  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
   def peeps
     @peeps = Peep.all
   end
  end




end
