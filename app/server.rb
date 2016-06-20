class Chitter < Sinatra::Base

  register Sinatra::Partial

  use Rack::MethodOverride

  enable :sessions
  enable :partial_underscores

  set :session_secret, 'super secret'
  set :partial_template_engine, :erb


  get '/' do
    redirect "/peeps/#{current_user.username}" if current_user
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
