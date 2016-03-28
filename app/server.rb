class Chitter < Sinatra::Base

  use Rack::MethodOverride

  register Sinatra::Flash
  register Sinatra::Partial

  enable :sessions
  set :session_secret, 'super secret'

  enable :partial_underscores
  set :partial_template_engine, :erb

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
