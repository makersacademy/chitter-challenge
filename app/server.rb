class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'session'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  use Rack::MethodOverride

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end
