class NomDiaries < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  get '/' do
    redirect 'noms'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

end
