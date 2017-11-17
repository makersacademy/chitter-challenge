class Chitter < Sinatra::Base
  configure do
    enable :sessions
    register Sinatra::Flash
    register Sinatra::Partial
    set :session_secret, 'bob now has no legs at all'
    set :partial_template_engine, :erb

    enable :partial_underscores
  end
end
