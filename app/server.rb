class Chitter < Sinatra::Base

  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  enable :sessions
  enable :partial_underscores

  register Sinatra::Flash
  register Sinatra::Partial

end
