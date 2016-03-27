class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  enable :partial_underscores
  set :partial_template_engine, :erb

  get '/' do
    redirect '/sign-up'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

# start the server if ruby file executed directly
  run! if app_file == $0

end
