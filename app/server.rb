class Chitter < Sinatra::Base
  use Rack::MethodOverride

  register Sinatra::Flash
  register Sinatra::Partial

  enable :sessions
  enable :partial_underscores

  set :session_secret, 'top secret'
  set :partial_template_engine, :erb

  helpers do
    def current_maker
      @current_maker ||= Maker.get(session[:maker_id])
    end
  end
end
