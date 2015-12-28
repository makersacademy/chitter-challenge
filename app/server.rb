class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial

  enable :partial_underscores
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
     @current_user ||= User.get(session[:user_id])
    end
  end

  get '/home' do
    erb(:home)
  end
end
