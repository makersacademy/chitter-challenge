class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  set(:auth) do |_val|
    condition do
      if !logged_in?
        redirect '/sessions/new'
      else
        current_user
      end
    end
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def logged_in?
      !session[:user_id].nil?
    end
  end
end
