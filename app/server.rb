class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
