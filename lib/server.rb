class Tweeter < Sinatra::Base
  use Rack::MethodOverride

  register Sinatra::Flash

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  enable :sessions
  set :session_secret, 'secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def all_twits
      @all_twits ||= Twit.all(order: [:time_stamp.desc])
    end
  end
end
