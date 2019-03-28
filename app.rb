require 'sinatra/base'
class App < Sinatra::Base
  # enable :sessions
  # configure(:development) { set :session_secret, "something" }
  get '/' do
    erb(:index)
  end

  run! if app_file == $PROGRAM_NAME
end
