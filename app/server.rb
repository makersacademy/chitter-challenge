class ChitterApp < Sinatra::Base

  enable :sessions
  enable :method_override
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores
  use Rack::MethodOverride

  get '/' do
    erb :index
  end
end
