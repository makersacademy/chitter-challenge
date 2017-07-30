class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, SecureRandom.hex(20)
  set :partial_template_engine, :erb

  enable :partial_underscores

  get "/" do
    if current_user
      redirect to("/peeps")
    else
      erb :index
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end
