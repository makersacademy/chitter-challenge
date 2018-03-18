require 'sinatra/base'
require 'sinatra/flash'
require './lib/blah'
require './database_connection_setup'

class BlahBlah < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/blahs'
  end

  get '/blahs' do
    @blahs = Blah.all
    erb :'blahs/index'
  end

  post '/blahs' do
    flash[:notice] = 'You must enter some text!'
    flash[:notice] unless Blah.create(params[:blah])
    redirect '/'
  end

  get '/blahs/new' do
    erb :'blahs/new'
  end

  run! if app_file == $0
end
