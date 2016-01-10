class Chitter < Sinatra::Base
  set :root, File.dirname(__FILE__)
  enable :sessions
  register Sinatra::Flash
  register Sinatra::MultiRoute
  register Sinatra::Partial
  use Rack::MethodOverride

  enable :partial_underscores
  set :partial_template_engine, :erb
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end
