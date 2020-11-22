require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/feed' do
    @user_name = session[:username]
    erb :feed
  end

  post '/user_name' do 
    session[:username] = params[:username]
    redirect '/feed'
  end

  run! if app_file == $0
end