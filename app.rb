require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/chit'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Welcome to Chitter!"
  end

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/chits/new' do
    erb :'chits/new'
  end

  post '/chits' do
    Chit.create(text: params[:chit])
    redirect '/chits'
  end

  get '/signup' do
    erb :"chits/signup"
  end

  post '/chits/join' do
    flash[:join] = "Welcome, you little chitter-er"
    redirect '/chits'
  end

  run! if app_file == $0
end
