require 'sinatra/base'
require './lib/user'
require './config/datamapper'
require 'pry'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end
  get '/signin' do
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/error1'
    end
  end

  get '/error1' do
    erb :error1
  end

  post '/storing-message' do
    @message = Message.create(:content => params[:message])
    redirect '/'
  end

  get '/profile' do
    @user = User.get(session[:user_id])
    erb :profile
  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  run! if app_file == $0
end
