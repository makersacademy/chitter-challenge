require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to chitter'
  end

  get '/chitter' do
    p session
    session[:message]
  end

  get '/chitter/new' do
    erb(:'chitter/new')
  end

  post '/chitter' do
    session[:message] = params[:message] 
    redirect ('/chitter')
  end

  run! if app_file == $0
end