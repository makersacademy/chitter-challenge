require 'sinatra/base'

class ChitterChallenge < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :'sign-up'
  end

  post '/sign-up' do
    session[:username] = params[:username]
    redirect to '/signed-in'
  end

  get '/signed-in' do
    @username = session[:username]
    erb :'signed-in'
  end

  get '/signed-out' do
    session[:username] = nil
    erb :'signed-out'
  end

  get '/sign-in' do
    erb :'sign-in'
  end

  post '/sign-in' do
    session[:username] = params[:username]
    redirect to '/signed-in'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
