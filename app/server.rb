require_relative "helpers"

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, "super_secret"

  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers Helpers
end
