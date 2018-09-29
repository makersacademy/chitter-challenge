require 'sinatra/base'

class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'something secret'

  get '/' do
    "This is my route"
  end
end
