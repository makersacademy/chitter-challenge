class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial

  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  TIME_FORMAT = '%H:%M %d/%m/%y'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
