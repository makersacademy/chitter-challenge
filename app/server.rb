require_relative './helpers'

class Chitter < Sinatra::Base

  set :session_secret, 'super secret'
  set :method_override, true
  set :partial_template_engine, :erb
  
  enable :sessions
  enable :partial_underscores

  register Sinatra::Flash
  register Sinatra::Partial

  helpers Helpers

end
