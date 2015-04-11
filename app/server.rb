require 'sinatra/base'
require 'sinatra/reload'
require 'sinatra/partial'
require 'data-mapper'
require 'rack-flash'

class Chitter < Sinatra::Base
  configure :production do
    enable :reloader
  end

  enable :sessions
  set :session_secret, 'super secret'

  use Rack::Flash
  use Rack::MethodOverride

  register Sinatra::Partial
  set :partial_templete_engine, :erb

end