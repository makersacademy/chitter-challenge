class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb

  enable :partial_underscores
  enable :sessions
  set :session_secret, 'super secret'

  require_relative 'helpers'

  get '/' do
    redirect '/peeps'
  end

  helpers Helpers
end
