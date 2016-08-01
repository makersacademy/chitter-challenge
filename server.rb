class ChitterCore < Sinatra::Base

  use Rack::MethodOverride
  enable :sessions
  set :session_secet, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get session[:user_id]
    end
  end

  run! if app_file == $0
  
end
