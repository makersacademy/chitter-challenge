class Chitter < Sinatra::Base
  enable :sessions
  enable :partial_underscores

  register Sinatra::Flash
  register Sinatra::Partial

  use Rack::MethodOverride

  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/sessions/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
