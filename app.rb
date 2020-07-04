require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/message' do
    session[:message] = params[:message]
    session[:user] = params[:user]
    redirect to('/chitter_board')
  end

  get '/chitter_board' do
    @message = session[:message]
    @user = session[:user]
    erb :chitter_board
  end

end