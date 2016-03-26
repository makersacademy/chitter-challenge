
class Chitter < Sinatra::Base

  register Sinatra::Partial
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :sessions_secret, 'super secret'
  set :partial_template_engine, :erb
  enable :partial_underscores
  get '/' do
    'Hello chitter-challenge!'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:usser_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
