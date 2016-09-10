class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  set :method_override, true
  set :partial_template_engine, :erb
  register Sinatra::Flash
  register Sinatra::Partial

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
end
