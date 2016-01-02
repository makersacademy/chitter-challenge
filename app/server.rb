class Chitter < Sinatra::Base
  set :root, File.dirname(__FILE__)
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
