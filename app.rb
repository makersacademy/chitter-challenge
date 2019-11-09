require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @handle = session[:handle]
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/new-user' do
    session[:handle] = params['handle']
    redirect '/'
  end

  run! if app_file == $0
end
