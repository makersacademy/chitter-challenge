class Chitter < Sinatra::Base

  APP_NAME = "Chitter"

  enable :sessions
  set :session_secret, 'super duper secret muahaha'
  use Rack::MethodOverride

  register Sinatra::Flash
  register Sinatra::Partial

  enable :partial_underscores
  set :partial_template_engine, :erb

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/feed'
  end

end
