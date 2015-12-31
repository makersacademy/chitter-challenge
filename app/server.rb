class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
