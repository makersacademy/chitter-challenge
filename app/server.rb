class Chitter < Sinatra::Base
use Rack::MethodOverride
register Sinatra::Flash
enable :sessions
#set :session_secret, 'super secret'


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
