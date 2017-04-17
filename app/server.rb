class Chitter < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb

  enable :partial_underscores
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect to '/peeps'
  end

end
