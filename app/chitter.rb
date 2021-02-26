require 'sinatra'

class Chitter < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    'Hello World'
  end
end
