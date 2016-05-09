class Chitter < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end

end
