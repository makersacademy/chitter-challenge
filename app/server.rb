class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'secretchitter'
  use Rack::MethodOverride
  register Sinatra::Flash
  # register Sinatra::Partial
  # set :partial_template_engine, :erb
  helpers do

    def current_user
      @current_user ||= User.get(session[:id])
    end

    def login_error
      flash.now['login_error'] = 'Username or password incorrect'
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
