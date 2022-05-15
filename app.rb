require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  register Sinatra::Reloader

  run! if app_file == $0

  get '/' do 
    redirect './index'
  end

  get '/index' do
    erb :'index'
  end

  post '/index' do
    # p params
    # $name = params[:display_name]
    # $peep = params[:peep]
    redirect './index'
  end

  get '/new' do
    erb :'new'
  end

end