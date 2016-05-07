class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  use Rack::MethodOverride


  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end

end
