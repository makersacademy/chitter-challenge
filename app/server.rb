class Chitter < Sinatra::Base

  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash


  get '/' do
    erb :'home'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
