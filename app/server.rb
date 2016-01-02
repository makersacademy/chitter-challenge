class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  set :session_secret, 'awesomesecret'
  set :partial_template_engine, :erb
  helpers Helpers
end
