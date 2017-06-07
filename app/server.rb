class Chitter < Sinatra::Base

  enable :sessions
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
