class Chitter < Sinatra::Base

  enable :sessions

  register Sinatra::Flash
  register Sinatra::Partial

  enable :partial_underscores
  set :partial_template_engine, :erb

  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
