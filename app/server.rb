require_relative "helpers"

class Chitter < Sinatra::Base

  helpers Helpers
  enable :sessions
  set :session_secret, "super secret"
  set :method_override, true
  set :partial_template_engine, :erb
  register Sinatra::Flash
  register Sinatra::Partial

  enable :partial_underscores

end
