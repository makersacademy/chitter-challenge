require 'sinatra/base'
require './lib/data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set    :views, proc { File.join(root, '.', 'views') }

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    session[:user] = params[:username]
    erb :'sessions/sessions'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
