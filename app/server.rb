class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
