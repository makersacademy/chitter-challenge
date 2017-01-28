class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'

  get '/' do
    'Hello test'
  end

  helpers do

  end
end
