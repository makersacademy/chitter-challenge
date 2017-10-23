class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :partial_template_engine, :erb
  enable :partial_underscores
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:current_user_id])
    end

    def peeps
      @peeps ||= Peep.all(:order => :created_at.desc)
    end
  end
end
