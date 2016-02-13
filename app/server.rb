class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  # register Sinatra::Partial
  # set :partial_template_engine, :erb
  # enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
