class Chitter < Sinatra::Base

  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  set :public_folder, 'static'

  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
