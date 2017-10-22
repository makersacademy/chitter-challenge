class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do
    def current_maker
      @current_maker ||= Maker.get(session[:maker_id])
    end
  end

  get '/' do
    erb :index
  end

end
