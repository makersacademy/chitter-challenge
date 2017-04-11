class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def date_and_time(time)
      time.strftime("%c")
    end
  end
end

require_relative "controllers/users"
require_relative "controllers/sessions"
require_relative "controllers/peeps"
