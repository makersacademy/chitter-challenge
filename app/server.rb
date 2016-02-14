
class Chitter < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'really really secret'
  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers do
    def current_user
      @current_user = User.first(id: session[:user_id])
    end
  end

end
