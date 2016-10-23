class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
