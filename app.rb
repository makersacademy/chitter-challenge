require 'sinatra/base'
class Chitter < Sinatra::Base
  # enable :sessions
  # configure(:development) { set :session_secret, "something" }

  get '/' do
    redirect '/chitter'
  end
  
  get '/chitter' do
    erb(:index)
  end

  run! if app_file == $PROGRAM_NAME
end
