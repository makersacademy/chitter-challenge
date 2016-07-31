class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  set :public_folder, 'public'

  enable :partial_underscores

  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end
  end

end
