class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  use Rack::MethodOverride

  helpers Helpers

  get '/' do
    erb :index
  end

end
